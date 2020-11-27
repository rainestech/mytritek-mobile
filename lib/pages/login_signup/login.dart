import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tritek_lms/appTheme/appTheme.dart';
import 'package:tritek_lms/pages/login_signup/forgot_password.dart';
import 'package:tritek_lms/pages/login_signup/signup.dart';
import 'package:tritek_lms/pages/profile/profile_home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Initially password is obscure
  bool _obscureText = true;
  DateTime currentBackPressTime;

  // Toggles the password show status
  void _viewPassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/appbar_bg.png'), fit: BoxFit.cover),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0.0,
            left: 0.0,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.1, 0.3, 0.5, 0.7, 0.9],
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.55),
                    Colors.black.withOpacity(0.67),
                    Colors.black.withOpacity(0.79),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 70.0, left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome to',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'MyTritek',
                          style: TextStyle(
                            color: themeGold,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: 70.0),
                  Padding(
                    padding: EdgeInsets.only(right: 20.0, left: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200].withOpacity(0.3),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: TextField(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20.0),
                          hintText: 'Username',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: EdgeInsets.only(right: 20.0, left: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200].withOpacity(0.3),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child:
                      TextField(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20.0, top: 13.0, bottom: 12.0),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            // fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: Icon(Icons.remove_red_eye),
                            onPressed: _viewPassword,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Padding(
                    padding: EdgeInsets.only(right: 20.0, left: 20.0),
                    child: SizedBox(
                      height: 50.0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.bottomRight,
                            stops: [0.1, 0.5, 0.9],
                            colors: [
                              Colors.yellow[300].withOpacity(0.6),
                              Colors.yellow[500].withOpacity(0.8),
                              Colors.yellow[600].withOpacity(1.0),
                            ],
                          ),
                        ),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: ProfileHome()));
                          },
                          color: Colors.transparent,
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: SignUp()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          fontFamily: 'Signika Negative',
                          fontSize: 17.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: ForgotPassword()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Text(
                        'Forgot your password?',
                        style: TextStyle(
                          fontFamily: 'Signika Negative',
                          fontSize: 17.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30.0),
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(15.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/google.png',
                              height: 25.0,
                              fit: BoxFit.fitHeight,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              'Login with Google',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Once Again to Exit.',
        backgroundColor: Colors.black,
        textColor: Theme.of(context).appBarTheme.color,
      );
      return Future.value(false);
    }
    exit(0);
    return Future.value(true);
  }
}
