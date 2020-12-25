import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:tritek_lms/appTheme/appTheme.dart';

class WebviewInApp extends StatefulWidget {
  final String url;

  WebviewInApp(this.url);

  @override
  _WebviewInApp createState() => _WebviewInApp();
}

class _WebviewInApp extends State<WebviewInApp> {
  String url = '';
  double progress = 0;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
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
          body: Stack(
            children: [
              InAppWebView(
                initialUrl: widget.url,
                initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions(
                        debuggingEnabled: true,
                        useShouldOverrideUrlLoading: true)),
                onWebViewCreated: (InAppWebViewController controller) {},
                onLoadStart: (InAppWebViewController controller, String _url) {
                  setState(() {
                    url = _url;
                  });
                },
                onLoadStop:
                    (InAppWebViewController controller, String _url) async {
                  setState(() {
                    url = _url;
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
                  return ShouldOverrideUrlLoadingAction.CANCEL;
                },
              ),
              isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Stack(),
            ],
          )),
    );
  }
}
