import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tritek_lms/appTheme/appTheme.dart';
import 'package:tritek_lms/blocs/user.bloc.dart';

import 'home/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _ping = false;
  bool _error = false;

  @override
  void initState() {
    super.initState();

    userBloc.pingSubject.listen((value) {
      if (!mounted) {
        return;
      }

      if (value != null && value.data != null && !_ping) {
        _ping = true;
        Timer(
            Duration(seconds: 1),
            () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                ));
      }

      if (value?.error != null && value.error.length > 0 && !_error) {
        _error = true;
      }
    });

    if (_ping) {
      Timer(
          Duration(seconds: 1),
          () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              ));
    }

    userBloc.pingServer();
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
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
      bottomSheet:
      Container(
        height: 20,
        width: width,
        color: themeBlue,
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if(!_error)
              SpinKitRipple(color: themeGold),
            Text(
              _error
                  ? 'An error has occurred. Please check your internet connection'
                  : '...loading',
              style: TextStyle(
                fontFamily: 'Signika Negative',
                fontWeight: FontWeight.w700,
                fontSize: 12.0,
                color: themeGold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
