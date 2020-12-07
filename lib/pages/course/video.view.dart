import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class VideoViewLesson extends StatefulWidget {
  final int lessonId;
  final String token;

  VideoViewLesson(this.lessonId, this.token);

  @override
  _VideoViewLesson createState() => _VideoViewLesson();
}

class _VideoViewLesson extends State<VideoViewLesson> {
  InAppWebViewController _webViewController;
  String url = "";
  double progress = 0;

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    String _token = widget.token;
    // initialUrl: 'http://10.0.2.2/video/8603',

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'MyTrikek',
            style: TextStyle(color: Colors.amber),
          ),
        ),
        body: InAppWebView(
          initialUrl: 'http://10.0.2.2/api/video/8603?token=$_token',
          initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
            debuggingEnabled: true,
          )),
          onWebViewCreated: (InAppWebViewController controller) {
            _webViewController = controller;

            _webViewController.addJavaScriptHandler(
                handlerName: 'handlerFoo',
                callback: (args) {
                  // return data to JavaScript side!
                  return {'bar': 'bar_value', 'baz': 'baz_value'};
                });

            _webViewController.addJavaScriptHandler(
                handlerName: 'handlerFooWithArgs',
                callback: (args) {
                  print(args);
                  // it will print: [1, true, [bar, 5], {foo: baz}, {bar: bar_value, baz: baz_value}]
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
            });
          },
          onProgressChanged:
              (InAppWebViewController controller, int _progress) {
            setState(() {
              progress = _progress / 100;
            });
          },
        ),
      ),
    );
  }
}

