import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tritek_lms/pages/video_play/video_play.dart';

class Lessons extends StatefulWidget {
  final scaffoldKey;

  Lessons({Key key, this.scaffoldKey}) : super(key: key);
  @override
  _LessonsState createState() => _LessonsState();
}

class _LessonsState extends State<Lessons> {
  final lessonList = [
    {
      'title': 'Trailer',
      'img': 'assets/new_course/new_course_1.png',
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'status': 'unlocked'
    },
    {
      'title': 'Lesson 1',
      'img': 'assets/new_course/new_course_2.png',
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'status': 'locked'
    },
    {
      'title': 'Lesson 2',
      'img': 'assets/new_course/new_course_3.png',
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'status': 'locked'
    },
    {
      'title': 'Lesson 3',
      'img': 'assets/new_course/new_course_4.png',
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'status': 'locked'
    },
    {
      'title': 'Lesson 4',
      'img': 'assets/new_course/new_course_5.png',
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'status': 'locked'
    },
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    _checkStatus(String status) {
      if (status == 'locked') {
        widget.scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text(
          'First purchase this course then you access this lesson.',
          style: TextStyle(fontSize: 14.0),
        )));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => VideoPlay()));
      }
    }

    return ListView.builder(
      itemCount: lessonList.length,
      itemBuilder: (context, index) {
        final item = lessonList[index];
        return Column(
          children: <Widget>[
            InkWell(
              onTap: () {
                _checkStatus(item['status']);
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: width - 25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, bottom: 4.0, right: 8.0, left: 8.0),
                            child: AutoSizeText(
                              '${item['title']}',
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'Signika Negative',
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.7,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 0.0, right: 8.0, left: 8.0, bottom: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.av_timer,
                                  size: 20.0,
                                ),
                                SizedBox(width: 3.0),
                                Text(
                                   '9 mins, 50s',// '${item['video_time']}',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    color: Colors.grey,
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.edit_off,
                                  size: 20.0,
                                ),
                                SizedBox(width: 3.0),
                                Text(
                                   '9 Quizzes',// '${item['video_time']}',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 0.0, right: 8.0, left: 8.0, bottom: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  (item['status'] == 'locked')
                                      ? Icons.lock
                                      : Icons.lock_open,
                                  size: 20.0,
                                ),
                                SizedBox(width: 3.0),
                                Text((item['status'] == 'locked')
                                    ? 'Locked'
                                    : 'Unlocked'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
          ],
        );
      },
    );
  }
}
