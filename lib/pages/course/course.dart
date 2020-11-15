import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tritek_lms/appTheme/appTheme.dart';
import 'package:tritek_lms/dataClass/passDataToCoursePage.dart';
import 'package:tritek_lms/pages/course/lessons.dart';
import 'package:tritek_lms/pages/course/overview.dart';
import 'package:tritek_lms/pages/payment/select_plan.dart';
import 'package:tritek_lms/pages/video_play/video_play.dart';

class CoursePage extends StatefulWidget {
  final PassData courseData;
  final int lang;

  CoursePage({Key key, @required this.courseData, this.lang}) : super(key: key);
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  bool wishlist = false;
  bool subscribed = false;
  bool preview = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  onAddedInWishlist() {
    setState(() {
      if (wishlist) {
        wishlist = false;
      } else {
        wishlist = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    PassData courseData = widget.courseData;
    double width = MediaQuery.of(context).size.width;

    nestedAppBar(_scaffoldKey) {
      return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 400,
              pinned: true,
              forceElevated: true,
              automaticallyImplyLeading: false,
              backgroundColor: themeBlue,
              elevation: 0.0,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: iconColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: <Widget>[
                InkWell(
                  onTap: () {
                    onAddedInWishlist();
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        (wishlist) ? Icons.check : Icons.add,
                        color: iconColor,
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        (wishlist) ? 'Added to Wishlist' : 'Add to Wishlist',
                        style: TextStyle(
                            color: textColor,
                            fontFamily: 'Signika Negative',
                            fontSize: 16.0),
                      ),
                      SizedBox(width: 10.0),
                    ],
                  ),
                )
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 0.0,
                      left: 0.0,
                      child: Container(
                        width: width,
                        height: 370.0,
                        padding: EdgeInsets.all(20.0),
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(courseData.image),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        width: width,
                        height: 370.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 50.0,
                      left: 0.0,
                      child: Container(
                        height: 250.0,
                        width: width,
                        padding: EdgeInsets.all(15.0),
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Instructor - Tritek Team',
                              style: TextStyle(
                                color: themeGold,
                                fontSize: 14.0,
                                fontFamily: 'Signika Negative',
                              ),
                            ),
                            // SizedBox(height: 5.0),
                            Spacer(),
                            AutoSizeText(
                               'Course Title with more text to break the line and test autosize till it overflows. I think we\'re good!',// c
                              minFontSize: 20,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,// ourseData.courseTitle,
                              style: TextStyle(
                                color: themeGold,
                                fontSize: 30.0,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Signika Negative',
                              ),
                            ),
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          '5/5',
                                          style: TextStyle(
                                            color: textColor,
                                            fontSize: 14.0,
                                            fontFamily: 'Signika Negative',
                                          ),
                                        ),
                                        SizedBox(width: 2.0),
                                        Icon(
                                          Icons.star,
                                          color: iconColor,
                                          size: 15.0,
                                        ),
                                        SizedBox(width: 5.0),
                                        Text(
                                          '(${51} Reviews)',
                                          style: TextStyle(
                                            color: textColor,
                                            fontSize: 14.0,
                                            fontFamily: 'Signika Negative',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      '\$${20}',
                                      style: TextStyle(
                                        color: textColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24.0,
                                        fontFamily: 'Signika Negative',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // SizedBox(height: 10.0),
                            Spacer(),

                            if (subscribed) InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SelectPlan(
                                              courseName: courseData.courseTitle,
                                              image: courseData.image,
                                              price: '50',
                                            )));
                              },
                              child: Container(
                                width: width,
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(13.0),
                                decoration: BoxDecoration(
                                    color: buttonColor,
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Text(
                                  'Take the Course',
                                  style: TextStyle(
                                    fontFamily: 'Signika Negative',
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    wordSpacing: 3.0,
                                    letterSpacing: 0.6,
                                  ),
                                ),
                              ),
                            ),
                            if (!subscribed) InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SelectPlan(
                                              courseName: courseData.courseTitle,
                                              image: courseData.image,
                                              price: '50',
                                            )));
                              },
                              child: Container(
                                width: width,
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(13.0),
                                decoration: BoxDecoration(
                                    color: themeBlue,
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Text(
                                  'Buy Membership',
                                  style: TextStyle(
                                    fontFamily: 'Signika Negative',
                                    fontSize: 16.0,
                                    color: themeGold,
                                    fontWeight: FontWeight.w700,
                                    wordSpacing: 3.0,
                                    letterSpacing: 0.6,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            if (preview) InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => VideoPlay()));
                              },
                              child: Container(
                                width: width,
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(13.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Text(
                                  'Watch Trailer',
                                  style: TextStyle(
                                    fontFamily: 'Signika Negative',
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    wordSpacing: 3.0,
                                    letterSpacing: 0.6,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              bottom: TabBar(
                tabs: [
                  Tab(
                    child: Text(
                      'Overview',
                      style: TextStyle(
                        fontFamily: 'Signika Negative',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                          color: themeGold
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Curriculum',
                      style: TextStyle(
                        fontFamily: 'Signika Negative',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        color: themeGold
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          children: [
            ListView(
              children: <Widget>[
                OverviewCoursePage(),
              ],
            ),
            Lessons(
              scaffoldKey: _scaffoldKey,
            ),
          ],
        ),
      );
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        body: nestedAppBar(_scaffoldKey),
      ),
    );
  }
}


// class CourseActions extends StatelessWidget {
//   final bool activeSub;
//   final bool trailer;
//
//   const CourseActions({Key key, this.activeSub, this.trailer}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
//
// }

// class ColoredTabBar extends Container implements PreferredSizeWidget {
//   ColoredTabBar(this.color, this.tabBar);
//
//   final Color color;
//   final TabBar tabBar;
//
//   @override
//   Size get preferredSize => tabBar.preferredSize;
//
//   @override
//   Widget build(BuildContext context) => Container(
//     color: color,
//     child: tabBar,
//   );
// }