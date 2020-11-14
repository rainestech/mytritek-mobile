import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tritek_lms/pages/common/carousel_image_item.dart';

class MainSlider extends StatefulWidget {
  @override
  _MainSliderState createState() => _MainSliderState();
}

class _MainSliderState extends State<MainSlider> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(bottom: 0.0),
      child: Column(
        children: <Widget>[
          CarouselSlider(
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
            items: [
              CarouselImageItem(width, "Business Analysis", "Delivered By Tritek Team", "assets/courses/Business-Analysis.jpg", ""),
              CarouselImageItem(width, "Project Management", "Delivered By Tritek Team", "assets/courses/project-management.jpg", ""),
              CarouselImageItem(width, "Cyber Security", "Delivered By Tritek Team", "assets/courses/cyber-scurity.jpg", ""),
              CarouselImageItem(width, "Emotional Intelligence", "Delivered By Tritek Team", "assets/courses/Emotional-Intelligence.png", ""),
              CarouselImageItem(width, "Soft Skills Training", "Delivered By Tritek Team", "assets/courses/Soft-skills-scaled.jpg", ""),
            ],
          ),
        ],
      ),
    );
  }
}
