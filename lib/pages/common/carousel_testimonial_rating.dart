import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tritek_lms/appTheme/appTheme.dart';

class CarouselTestimonialRating extends StatelessWidget {
  final testimony;
  final name;
  final width;
  final image;
  final rating;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) => ProductListView()));
      },
      child: Container(
        width: width,
        height: 120,
        margin: EdgeInsets.all(0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 80.0,
                    width: 80.0,
                    margin: EdgeInsets.fromLTRB(20, 1, 5, 1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                        image:
                        AssetImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 25.0,
                    width: 80.0,
                    margin: EdgeInsets.fromLTRB(20, 5, 5, 0),
                    child: AutoSizeText(name,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                        color: themeBlue,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              height: 90.0,
              width: (width - 140),
              margin: EdgeInsets.fromLTRB(1, 5, 5, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Bubble(
                    margin: BubbleEdges.all(0),
                    nip: BubbleNip.leftTop,
                    color: Color(0xFFBDBDBD),
                    // color: themeBlue.withOpacity(0.1),
                    child: Text(testimony,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  RatingBarIndicator(
                    rating: 2.5,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 20.0,
                    direction: Axis.horizontal,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  CarouselTestimonialRating(this.width, this.name, this.testimony, this.image, this.rating);
}