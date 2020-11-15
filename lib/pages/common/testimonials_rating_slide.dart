import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tritek_lms/appTheme/appTheme.dart';
import 'package:tritek_lms/pages/common/carousel_testimonial_rating.dart';

class TestimonialRatingSlider extends StatefulWidget {
  @override
  _TestimonialRatingSlider createState() => _TestimonialRatingSlider();
}

class _TestimonialRatingSlider extends State<TestimonialRatingSlider> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: 170.0,
      color: Theme.of(context).appBarTheme.color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 2),
            child: Text(
              'Reviews',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: themeGold,
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Signika Negative',
                letterSpacing: 0.7,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 125.0,
            child: FutureBuilder<List<TestimonyRatingList>>(
              future: loadProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData ?
                  Container(
                    child: CarouselSlider(
                    options: CarouselOptions(
                      height: (height / 4.0),
                      enlargeCenterPage: true,
                      autoPlay: false,
                      aspectRatio: 16 / 9,
                      autoPlayInterval: const Duration(seconds: 20),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      viewportFraction: 1.0,

                    ),
                    items: [
                      for(var item in snapshot.data )
                        CarouselTestimonialRating(width, item.name, item.testimony, item.image, item.rating),
                    ],
                  ),
                  ) :
                  Center(
                    child: SpinKitRipple(color: Colors.red),
                  );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TestimonyRatingList {
  int id;
  String name;
  String image;
  String testimony;
  String rating;

  TestimonyRatingList(this.id, this.name, this.testimony, this.image, this.rating);
}

Future<List<TestimonyRatingList>> loadProducts() async {
  var jsonString = await rootBundle.loadString('assets/json/testimony_slide.json');
  final jsonResponse = json.decode(jsonString);

  List<TestimonyRatingList> subs = [];

  for (var o in jsonResponse) {
    TestimonyRatingList course = TestimonyRatingList(
        o["id"],
        o["name"],
        o["testimony"],
        o["image"],
        o["rating"]);

    subs.add(course);
  }

  return subs;
}