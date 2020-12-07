import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebviewInApp extends StatefulWidget {
  final String url;

  WebviewInApp(this.url);

  @override
  _WebviewInApp createState() => _WebviewInApp();
}

class _WebviewInApp extends State<WebviewInApp> {
  InAppWebViewController _webViewController;
  String url = "";
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('InAppWebView Example'),
        ),
        body: InAppWebView(
          initialUrl: url,
          initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
            debuggingEnabled: true,
          )),
          onWebViewCreated: (InAppWebViewController controller) {
            _webViewController = controller;
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
