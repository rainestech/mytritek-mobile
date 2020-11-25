import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tritek_lms/data/entity/courses.dart';
import 'package:tritek_lms/pages/video_play/video_play.dart';

class LessonView extends StatefulWidget {
  final scaffoldKey;
  final List<Sections> sections;

  LessonView({Key key, this.scaffoldKey, this.sections}) : super(key: key);

  @override
  _LessonViewState createState() => _LessonViewState();
}

class _LessonViewState extends State<LessonView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    _checkStatus(String status) {
      if (status == 'no') {
        widget.scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text(
          'First Subscribe to one of the membership plans, then you can view the course.',
          style: TextStyle(fontSize: 14.0),
        )));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => VideoPlay()));
      }
    }

    return ListView(children: [
      for (var item in widget.sections)
        ExpansionTile(
            title: AutoSizeText(
              item.sectionName,
              maxLines: 2,
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Signika Negative',
                fontWeight: FontWeight.w700,
                letterSpacing: 0.7,
              ),
            ),
            children: [
              for (var les in item.lessons)
                InkWell(
                  onTap: () {
                    _checkStatus(les.preview);
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
                                    top: 8.0,
                                    bottom: 4.0,
                                    right: 8.0,
                                    left: 8.0),
                                child: AutoSizeText(
                                  les.postTitle,
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
                                    top: 0.0,
                                    right: 8.0,
                                    left: 8.0,
                                    bottom: 8.0),
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
                                      getLessonTime(les),
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        height: 1.6,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Spacer(),
                                    if (les.quizCount != null)
                                      Icon(
                                        Icons.edit_off,
                                        size: 20.0,
                                      ),
                                    if (les.quizCount != null)
                                      SizedBox(width: 3.0),
                                    if (les.quizCount != null)
                                      Text(
                                        '${les.quizCount} Quizzes',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          height: 1.6,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    SizedBox(width: 3.0),
                                    Icon(
                                      (les.preview == 'no')
                                          ? Icons.lock
                                          : Icons.lock_open,
                                      size: 20.0,
                                    ),
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
            ])
    ]);
  }

  String getLessonTime(Lessons lessons) {
    var time = int.parse(lessons.duration.replaceAll(RegExp('[^0-9]'), ''));
    var d = Duration(minutes: time);
    List<String> parts = d.toString().split(':');
    if (parts[0] == '0') {
      return '${parts[1]} minutes';
    }
    if (parts[1] == '0') {
      return '${parts[0]} hour, ${parts[1]} minutes';
    }
    return '${parts[0]} hours, ${parts[1]} minutes';
  }
}
