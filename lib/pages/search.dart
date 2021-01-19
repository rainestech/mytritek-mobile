import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
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
  List<String> lessons = [];
  String selectedValue = '';
  List<Course> courses;

  @override
  void initState() {
    super.initState();
    bloc.getCourses();

    bloc.lessonStringList.listen((value) {
      if (!mounted) {
        return;
      }

      setState(() {
        lessons = value;
      });
    });

    bloc.subject.listen((value) {
      if (!mounted) {
        return;
      }

      setState(() {
        courses = value.results;
      });
    });

    bloc.getLessonStringList();
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
                backgroundColor: themeBlue,
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
                        child:
                        TypeAheadField(
                          textFieldConfiguration: TextFieldConfiguration(
                            autofocus: true,
                            style: DefaultTextStyle
                                .of(context)
                                .style
                                .copyWith(
                                fontStyle: FontStyle.italic
                            ),
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
                          suggestionsCallback: (pattern) async {
                            if (pattern.isEmpty) {
                              return [];
                            }

                            if (pattern == selectedValue) {
                              return [];
                            }

                            return lessons.where((e) =>
                                e.toLowerCase().contains(pattern.toLowerCase()))
                                .toList();
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              title: Text(suggestion),
                            );
                          },
                          onSuggestionSelected: (suggestion) {
                            setState(() {
                              searchController.text = suggestion;
                              selectedValue = suggestion;
                            });
                          },
                          hideOnEmpty: true,
                          hideOnError: true,
                          hideOnLoading: true,
                        )
                      // TextField(
                      //   controller: searchController,
                      //   decoration: InputDecoration(
                      //     hintText: 'Search lessons',
                      //     contentPadding: EdgeInsets.all(13),
                      //     hintStyle: TextStyle(
                      //       fontSize: 12.0,
                      //       color: Colors.grey,
                      //     ),
                      //     suffixIcon: IconButton(
                      //       icon: Icon(
                      //         // Based on passwordVisible state choose the icon
                      //         Icons.search,
                      //         color: themeGold,
                      //       ),
                      //       onPressed: () {
                      //         _search();
                      //       },
                      //     ),
                      //     border: InputBorder.none,
                      //   ),
                      // ),
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
      backgroundColor: themeBg,
    );
  }

  void _search() {
    String term = searchController.text;
    if (term == null || term.length < 1) {
      return;
    }

    if (courses == null) {
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchResult(term, courses),
      ),
    );
  }

}
