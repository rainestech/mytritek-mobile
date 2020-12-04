import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VideoViewLesson extends StatefulWidget {
  final int lessonId;

  VideoViewLesson(this.lessonId);

  @override
  _VideoViewLesson createState() => _VideoViewLesson();
}

class _VideoViewLesson extends State<VideoViewLesson> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'http://10.0.2.2/video/8603',
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
