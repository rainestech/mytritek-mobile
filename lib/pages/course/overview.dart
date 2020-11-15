import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:tritek_lms/appTheme/appTheme.dart';
import 'package:tritek_lms/pages/common/testimonials_rating_slide.dart';
import 'package:tritek_lms/pages/course/what_you_learn.dart';
import 'package:tritek_lms/pages/course/what_you_will_get.dart';

class OverviewCoursePage extends StatefulWidget {
  var isExpanded = false;

  @override
  _OverviewCoursePageState createState() => _OverviewCoursePageState();
}

class _OverviewCoursePageState extends State<OverviewCoursePage> with TickerProviderStateMixin<OverviewCoursePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(right: 10.0, left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          WhatYouWillGet(),
          new AnimatedSize(
              vsync: this,
              duration: const Duration(milliseconds: 300),
              child: new ConstrainedBox(
                  constraints: widget.isExpanded
                      ? new BoxConstraints()
                      : new BoxConstraints(maxHeight: 250.0),
                  child: Html(
                    data: """
                      <div class="course-description" id="learn-press-course-description">
                        <h4>COURSE DESCRIPTION</h4>
                        <p>We offer various flexible career development training workshops aimed at individuals and organisations seeking support to affect a wide range of career transitions.</p>
                        <p>Tritek Consulting brings you comprehensive project management development training that offers a range of tools to help improve the efficiency and productivity of the project at hand.<br>
                        With a range of team building exercises and time-crunching guides, this engaging program enables participants to understand the importance of their time, teaching them how to prioritize tasks and manage their time better.</p>
              
                        <h4>LEARNING OUTCOMES</h4>
                        <ul class="thim-list-content">
                          <li>Project management</li>
                          <li>Controlling projects</li>
                          <li>Monitoring projects</li>
                          <li>Risk management (overview)</li>
                          <li>Budget and resource management</li>
                          <li>Managing scope creep</li>
                          <li>Project planning</li>
                          <li>Understanding Waterfall</li>
                          <li>Agile framework</li>
                          <li>Earned value management</li>
                        </ul>
                        <p>There is no shortage of information on the various management techniques that can lead to better projects. However, implementing this knowledge isn’t as easy as it appears. Here at Tritek Consulting, we make it possible for you to understand your goals and apply the right tools for the job.</p>
                        <h5>Earlybird prices are available</h5>
                      </div>
                    """,
                    //Optional parameters:
                    onLinkTap: (url) {
                      // open url in a webview
                    },
                    onImageTap: (src) {
                      // Display the image in large form.
                    },
                  )
              )),
          widget.isExpanded
              ? new FlatButton(
              child: const Text('show less', style: TextStyle(color: Colors.blue),),
              onPressed: () => setState(() => widget.isExpanded = false))
              : new FlatButton(
              child: const Text('show more', style: TextStyle(color: Colors.blue),),
              onPressed: () => setState(() => widget.isExpanded = true)),
          SizedBox(height: 10),
          TestimonialRatingSlider(),
        ],
      ),
    );
  }
}

