import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tritek_lms/appTheme/appTheme.dart';
import 'package:tritek_lms/pages/home/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 5),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: themeBlue,
      body: Container(
        height: height,
        width: width,
        color: themeBlue,
        margin: EdgeInsets.all(10.0),
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image:
        //     AssetImage('assets/appbar_bg.png'),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // InkWell(
                //   child: Container(
                //     height: 150.0,
                //     width: 150.0,
                //     margin: EdgeInsets.all(10.0),
                //     decoration: BoxDecoration(
                //       image: DecorationImage(
                //         image:
                //         AssetImage('assets/icon.png'),
                //         fit: BoxFit.contain,
                //       ),
                //     ),
                //   ),
                // ),
                Text(
                  "Welcome to",
                  style: TextStyle(
                    fontFamily: 'Signika Negative',
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  appName,
                  style: TextStyle(
                    fontFamily: 'Signika Negative',
                    fontWeight: FontWeight.w700,
                    fontSize: 30.0,
                    color: themeGold,
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
}
