import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:tritek_lms/appTheme/appTheme.dart';
import 'package:tritek_lms/data/entity/note.dart';
import 'package:tritek_lms/http/endpoints.dart';
import 'package:tritek_lms/pages/notes/controller/NotePage.dart';

class InAppLessonView extends StatefulWidget {
  final int lessonId;
  final String token;

  InAppLessonView(this.lessonId, this.token);

  @override
  _VideoViewLesson createState() => _VideoViewLesson();
}

class _VideoViewLesson extends State<InAppLessonView> {
  InAppWebViewController _webViewController;
  CookieManager _cookieManager = CookieManager.instance();

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
          backgroundColor: themeBlue,
          title: const Text(
            'MyTrikek',
            style: TextStyle(
              color: Colors.amber,
            ),
          ),
        ),
        body: InAppWebView(
          initialUrl: '$playEndpoint$_lesson?token=$_token',
          initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                  // debuggingEnabled: true,
                  )),
          onWebViewCreated: (InAppWebViewController controller) {
            _webViewController = controller;

            // controller.addJavaScriptHandler(
            //   handlerName: "ping",
            //   callback: (List<dynamic> payload) {
            //     print(payload);
            //   },
            // );

            _webViewController.addJavaScriptHandler(
                handlerName: 'playVideo',
                callback: (args) {
                  // return data to JavaScript side!
                  return 123;
                });
            _webViewController.addJavaScriptHandler(
                handlerName: 'playPause',
                callback: (args) {
                  print('playPause: $args');
                });
            _webViewController.addJavaScriptHandler(
                handlerName: 'playTime',
                callback: (args) {
                  print('playTime: $args');
                  String arg = args[0].toString();
                  print('Args: $arg');
                  Notes note = Notes();
                  note.lessonId = int.parse(args[0]['lessonId']);
                  note.lesson = args[0]['lesson'];
                  note.sectionId = int.parse(args[0]['sectionId']);
                  note.section = args[0]['section'];
                  note.courseId = int.parse(args[0]['courseId']);
                  note.course = args[0]['course'];
                  note.time = _getTime(args[0]['playTime']);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NotePage(note)));
                });
          },
          onConsoleMessage: (controller, consoleMessage) {
            print(consoleMessage);
            // it will print: {message: {"bar":"bar_value","baz":"baz_value"}, messageLevel: 1}
          },
          onLoadStart: (InAppWebViewController controller, String _url) {
            setState(() {
              url = _url;
            });
          },
          onLoadStop: (InAppWebViewController controller, String _url) async {
            List<Cookie> cookies = await _cookieManager.getCookies(url: url);
            cookies.forEach((cookie) {
              print(cookie.name + " " + cookie.value);
            });
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
      ),
    );
  }

  String _getTime(arg) {
    var time = int.parse(arg);
    var d = Duration(seconds: time);
    return d.toString();
  }
}
