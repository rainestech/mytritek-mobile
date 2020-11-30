import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tritek_lms/appTheme/appTheme.dart';

class MyDialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key, String msg) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: themeBlue,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 10,
                        ),
                        AutoSizeText(
                          msg,
                          maxLines: 2,
                          style: TextStyle(color: themeGold),
                        )
                      ]),
                    )
                  ]));
        });
  }
}
