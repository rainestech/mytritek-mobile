import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tritek_lms/appTheme/appTheme.dart';
import 'package:tritek_lms/http/endpoints.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LessonWebView extends StatefulWidget {
  final int lessonId;
  final String token;

  LessonWebView(this.lessonId, this.token);

  @override
  _VideoViewLesson createState() => _VideoViewLesson();
}

class _VideoViewLesson extends State<LessonWebView> {
  String url = "";
  double progress = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    String _token = widget.token;
    String _lesson = widget.lessonId.toString();
    final _key = UniqueKey();

    // initialUrl: 'http://10.0.2.2/video/8603',

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: themeBlue,
          title: Text(
            appName,
            style: TextStyle(
              fontFamily: 'Signika Negative',
              fontWeight: FontWeight.w700,
              fontSize: 25.0,
              color: themeGold,
            ),
          ),
        ),
        body: Stack(children: [
          WebView(
            key: _key,
            initialUrl: '$playEndpoint$_lesson?token=$_token',
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
        ]),
      ),
    );
  }

  String _getTime(arg) {
    var time = int.parse(arg);
    var d = Duration(seconds: time);
    return d.toString();
  }
}
