import 'dart:convert';

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
                    debuggingEnabled: false,
                    useShouldOverrideUrlLoading: true)),
            onWebViewCreated: (InAppWebViewController controller) {
              _webViewController = controller;

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
                    String arg = args[0].toString();
                    Map<String, dynamic> data = jsonDecode(arg);
                    Notes note = Notes();
                    note.lessonId = int.parse(data['lessonId']);
                    note.lesson = data['lesson'];
                    note.sectionId = int.parse(data['sectionId']);
                    note.section = data['section'];
                    note.courseId = int.parse(data['courseId']);
                    note.course = data['course'];
                    note.time = _getTime(data['time'].toString());
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotePage(note)));
                  });
            },
            onConsoleMessage: (controller, consoleMessage) {
              print(consoleMessage);
              // it will print: {message: {"bar":"bar_value","baz":"baz_value"}, messageLevel: 1}
            },
            onLoadStart: (InAppWebViewController controller, String _url) {
              debugPrint('Loading url: $url');
              setState(() {
                url = _url;
              });
            },
            onLoadStop: (InAppWebViewController controller, String _url) async {
              // List<Cookie> cookies = await _cookieManager.getCookies(url: url);
              // cookies.forEach((cookie) {
              //   print(cookie.name + " " + cookie.value);
              // });
              debugPrint('Loaded url: $url');

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
            shouldOverrideUrlLoading:
                (controller, shouldOverrideUrlLoadingRequest) async {
              print("URL: ${shouldOverrideUrlLoadingRequest.url}");
              return ShouldOverrideUrlLoadingAction.ALLOW;
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

  String _getTime(String arg) {
    int time = int.parse(arg);
    Duration d = Duration(seconds: time);
    return _printDuration(d);
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
