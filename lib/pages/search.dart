import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tritek_lms/appTheme/appTheme.dart';
import 'package:tritek_lms/blocs/course.bloc.dart';
import 'package:tritek_lms/data/entity/courses.dart';
import 'package:tritek_lms/http/courses.dart';
import 'package:tritek_lms/pages/search.result.dart';

import 'common/utils.dart';
import 'course/course.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    bloc.getCourses();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    InkWell tagTile(String tag) {
      return InkWell(
        onTap: () {},
        child: Text(
          tag,
          style: TextStyle(
            fontSize: 18.0,
            fontFamily: 'Signika Negative',
            color: Colors.grey,
          ),
        ),
      );
    }

    InkWell _listCourseTag(Course course) {
      return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CoursePage(
                  courseData: course,
                ),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                course.title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Signika Negative',
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
            ],
          ));
    }

    Widget _listCourses(List<Course> data, double width, double height) {
      return ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Popular Courses',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'Signika Negative',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                for (Course item in data) _listCourseTag(item),
              ],
            ),
          ),
        ],
      );
    }

    nestedAppBar() {
      return NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 150,
                pinned: true,
                titleSpacing: 0.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    padding: EdgeInsets.all(20.0),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      color: themeBlue,
                    ),
                    child: Container(
                      // width: width - 20.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: 'Search lessons',
                          contentPadding: EdgeInsets.all(13),
                          hintStyle: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              Icons.search,
                              color: themeGold,
                            ),
                            onPressed: () {
                              _search();
                            },
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
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
                  return _listCourses(snapshot.data.results, width, height);
                } else {
                  return tagTile("");
                }
              }
          )
      );
    }

    return Scaffold(
      body: nestedAppBar(),
    );
  }

  void _search() {
    String term = searchController.text;
    if (term == null || term.length < 1) {
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchResult(term),
      ),
    );
  }

}
