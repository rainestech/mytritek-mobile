import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tritek_lms/appTheme/appTheme.dart';
import 'package:tritek_lms/blocs/course.bloc.dart';
import 'package:tritek_lms/data/entity/courses.dart';
import 'package:tritek_lms/http/courses.dart';

import 'common/utils.dart';

class MyCourse extends StatefulWidget {
  @override
  _MyCourseState createState() => _MyCourseState();
}

class _MyCourseState extends State<MyCourse> {
  @override
  void initState() {
    super.initState();
    bloc.getCourses();
  }

  var top = 0.0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    getCourseTile(Course course) {
      return Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              blurRadius: 1.5,
              spreadRadius: 1.5,
              color: Colors.grey[200],
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(course.image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            Container(
              width: width - 140.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 4.0, right: 8.0, left: 8.0),
                    child: AutoSizeText(
                      course.title,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Signika Negative',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.7,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 0.0, right: 8.0, left: 8.0, bottom: 8.0),
                    child: Text(
                      course.duration,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'Signika Negative',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.7,
                        color: headingColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 0.0, right: 8.0, left: 8.0, bottom: 8.0),
                    child: Text(
                      "Instructor - ${course.author}",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'Signika Negative',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.7,
                        color: headingColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    bool checkRegCourse(Course item, List<Course> data) {
      return false;
    }

    Widget _listCoursesWidget(List<Course> data, double width, double height) {
      return ListView(
        children: <Widget>[
          for (Course item in data)
            if (!checkRegCourse(item, data)) getCourseTile(item),
        ],
      );
    }

    Widget _noCourseWidget(double width, double height) {
      return ListView(
        children: <Widget>[],
      );
    }

    nestedAppBar() {
      return NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 180,
                pinned: true,
                backgroundColor: themeBlue,
                flexibleSpace: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  // print('constraints=' + constraints.toString());
                  top = constraints.biggest.height;
                  return FlexibleSpaceBar(
                      centerTitle: false,
                      title: AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        //opacity: top == 80.0 ? 1.0 : 0.0,
                        opacity: 1.0,
                        child: Text(
                          'My Courses',
                          style: TextStyle(
                            fontFamily: 'Signika Negative',
                            fontWeight: FontWeight.w700,
                            color: themeGold,
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                      background: Container(
                        padding: EdgeInsets.all(20.0),
                        alignment: Alignment.bottomLeft,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/appbar_bg.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ));
                }),
                automaticallyImplyLeading: false,
              ),
            ];
          },
          body: StreamBuilder<CoursesResponse>(
            stream: bloc.subject.stream,
            builder: (context, AsyncSnapshot<CoursesResponse> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.error != null &&
                    snapshot.data.error.length > 0) {
                  return HttpErrorWidget(snapshot.data.error, width, height);
                }

                if (snapshot.data.results.length < 1) {
                  return _noCourseWidget(width, height);
                }
                return _listCoursesWidget(snapshot.data.results, width, height);
              } else if (snapshot.hasError) {
                return HttpErrorWidget(snapshot.error, width, height);
              } else {
                return LoadingWidget(width, height);
              }
            },
          ));
    }

    return Scaffold(
      backgroundColor: themeBg,
      body: nestedAppBar(),
    );
  }
}

