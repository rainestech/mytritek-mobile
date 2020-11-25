import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tritek_lms/appTheme/appTheme.dart';
import 'package:tritek_lms/blocs/course.bloc.dart';
import 'package:tritek_lms/data/entity/courses.dart';
import 'package:tritek_lms/http/courses.dart';
import 'package:tritek_lms/pages/common/carousel_image_item.dart';

class MainSlider extends StatefulWidget {
  @override
  _MainSliderState createState() => _MainSliderState();
}

class _MainSliderState extends State<MainSlider> {
  @override
  void initState() {
    super.initState();
    bloc.getCourses();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
        padding: EdgeInsets.only(bottom: 0.0),
        child: StreamBuilder<CoursesResponse>(
          stream: bloc.subject.stream,
          builder: (context, AsyncSnapshot<CoursesResponse> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.error != null &&
                  snapshot.data.error.length > 0) {
                return _buildErrorWidget(snapshot.data.error, width, height);
              }
              return _buildCarouselWidget(snapshot.data.results, width, height);
            } else if (snapshot.hasError) {
              return _buildErrorWidget(snapshot.error, width, height);
            } else {
              return _buildLoadingWidget();
            }
          },
        ));
    // return Container(
    //   padding: EdgeInsets.only(bottom: 0.0),
    //   child: Column(
    //     children: <Widget>[
    //       CarouselSlider(
    //         options: CarouselOptions(
    //           height: (height / 4.0),
    //           enlargeCenterPage: true,
    //           autoPlay: true,
    //           aspectRatio: 16 / 9,
    //           autoPlayInterval: const Duration(seconds: 6),
    //           autoPlayCurve: Curves.fastOutSlowIn,
    //           enableInfiniteScroll: true,
    //           autoPlayAnimationDuration: const Duration(milliseconds: 800),
    //           viewportFraction: 1.0,
    //         ),
    //         items: [
    //           CarouselImageItem(width, "Business Analysis", "Delivered By Tritek Team", "assets/courses/Business-Analysis.jpg", ""),
    //           CarouselImageItem(width, "Project Management", "Delivered By Tritek Team", "assets/courses/project-management.jpg", ""),
    //           CarouselImageItem(width, "Cyber Security", "Delivered By Tritek Team", "assets/courses/cyber-scurity.jpg", ""),
    //           CarouselImageItem(width, "Emotional Intelligence", "Delivered By Tritek Team", "assets/courses/Emotional-Intelligence.png", ""),
    //           CarouselImageItem(width, "Soft Skills Training", "Delivered By Tritek Team", "assets/courses/Soft-skills-scaled.jpg", ""),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: SpinKitRipple(color: themeGold),
    );
  }

  Widget _buildCarouselWidget(List<Course> data, double width, double height) {
    return CarouselSlider(
      options: CarouselOptions(
        height: (height / 4.0),
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayInterval: const Duration(seconds: 6),
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 1.0,
      ),
      items: data.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return CarouselImageItem(i, width);
          },
        );
      }).toList(),
    );
  }

  Widget _buildErrorWidget(String error, double width, double height) {
    return Center(
      child: AutoSizeText(error),
    );
  }
}
