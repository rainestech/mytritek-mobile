import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tritek_lms/appTheme/appTheme.dart';
import 'package:tritek_lms/data/passDataToCoursePage.dart';
import 'package:tritek_lms/pages/course/course.dart';

class CarouselImageItem extends StatelessWidget {
  final courseOwner;
  final courseLink;
  final courseTitle;
  final width;
  final image;
  // final course;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CoursePage(
              courseData: PassData(
                  courseTitle,
                  courseOwner,
                  courseLink,
                  image
              ),
            ),
          ),
        );
      },
      child: Container(
        width: width,
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          // filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            decoration: new BoxDecoration(color: Colors.black.withOpacity(0.3)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  courseTitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontFamily: 'Signika Negative',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  courseOwner,
                  style: TextStyle(
                    color: themeGold,
                    fontSize: 15.0,
                    fontFamily: 'Signika Negative',
                  ),
                ),
              ],
            ),
          )
          // Column(
          //
          // ),
        ),
      ),
    );
  }

  CarouselImageItem(this.width, this.courseTitle, this.courseOwner, this.image, this.courseLink);
}