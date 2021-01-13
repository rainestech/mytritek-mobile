import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:tritek_lms/appTheme/appTheme.dart';
import 'package:tritek_lms/data/entity/note.dart';
import 'package:tritek_lms/http/endpoints.dart';
import 'package:tritek_lms/pages/notes/controller/NotePage.dart';

class VideoViewLessonss extends StatefulWidget {
  final int lessonId;
  final String token;

  VideoViewLessonss(this.lessonId, this.token);

  @override
  _VideoViewLessonss createState() => _VideoViewLessonss();
}

class _VideoViewLessonss extends State<VideoViewLessonss> {
  InAppWebViewController _webViewController;
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
    // initialUrl: 'http://10.0.2.2/video/8603',

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
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
          InAppWebView(
            initialUrl: '$playEndpoint$_lesson?token=$_token',
            initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
                    // debuggingEnabled: true,
                    )),
            onWebViewCreated: (InAppWebViewController controller) {
              _webViewController = controller;

              controller.addJavaScriptHandler(
                handlerName: "ping",
                callback: (List<dynamic> payload) {
                  print(payload);
                },
              );

              _webViewController.addJavaScriptHandler(
                  handlerName: 'playVideo',
                  callback: (args) {
                    // return data to JavaScript side!
                    return 123;
                  });
              _webViewController.addJavaScriptHandler(
                  handlerName: 'playPause',
                  callback: (args) {
                    print('playTime: $args');
                  });
              _webViewController.addJavaScriptHandler(
                  handlerName: 'playTime',
                  callback: (args) {
                    print('playTime: $args');
                    Notes note = Notes();
                    note.lessonId = int.parse(args[0]['lessonId']);
                    note.lesson = args[0]['lesson'];
                    note.sectionId = int.parse(args[0]['sectionId']);
                    note.section = args[0]['section'];
                    note.courseId = int.parse(args[0]['courseId']);
                    note.course = args[0]['course'];
                    note.time = _getTime(args[0]['playTime']);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotePage(note)));
                  });
            },
            onLoadStart: (InAppWebViewController controller, String _url) {
              setState(() {
                url = _url;
              });
            },
            onLoadStop: (InAppWebViewController controller, String _url) async {
              setState(() {
                url = _url;
                isLoading = false;
              });
            },
            onProgressChanged:
                (InAppWebViewController controller, int _progress) {
              setState(() {
                progress = _progress / 100;
              });
              if (_progress == 100) {
                setState(() {
                  isLoading = false;
                });
              }
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

