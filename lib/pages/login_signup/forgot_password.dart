import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tritek_lms/appTheme/appTheme.dart';
import 'package:tritek_lms/pages/home/home.dart';
import 'package:tritek_lms/pages/login_signup/otp_screen.dart';
import 'package:tritek_lms/pages/login_signup/signup.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  // Widget build(BuildContext context) {
  //   nestedAppBar() {
  //     return NestedScrollView(
  //       headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
  //         return <Widget>[
  //           SliverAppBar(
  //             expandedHeight: 180,
  //             pinned: true,
  //             leading: IconButton(
  //               icon: Icon(Icons.arrow_back_ios),
  //               onPressed: () {
  //                 Navigator.pop(context);
  //               },
  //             ),
  //             flexibleSpace: FlexibleSpaceBar(
  //               background: Container(
  //                 padding: EdgeInsets.all(20.0),
  //                 alignment: Alignment.bottomLeft,
  //                 decoration: BoxDecoration(
  //                   image: DecorationImage(
  //                     image: AssetImage('assets/appbar_bg.png'),
  //                     fit: BoxFit.cover,
  //                   ),
  //                 ),
  //                 child: Text(
  //                   'Forgot Password',
  //                   style: TextStyle(
  //                     fontFamily: 'Signika Negative',
  //                     fontWeight: FontWeight.w700,
  //                     fontSize: 25.0,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             automaticallyImplyLeading: false,
  //           ),
  //         ];
  //       },
  //       body: ListView(
  //         children: <Widget>[
  //           SizedBox(height: 30.0),
  //           Container(
  //             alignment: Alignment.center,
  //             margin: EdgeInsets.only(right: 30.0, left: 30.0),
  //             child: Column(
  //               children: <Widget>[
  //                 Text(
  //                   'Enter your registered email to forgot your password',
  //                   style: TextStyle(
  //                     fontSize: 13.0,
  //                     fontFamily: 'Signika Negative',
  //                     color: Colors.grey[500],
  //                   ),
  //                 ),
  //                 SizedBox(height: 20.0),
  //                 TextField(
  //                   decoration: InputDecoration(
  //                     hintText: 'Enter registered email',
  //                     hintStyle: TextStyle(
  //                       fontFamily: 'Signika Negative',
  //                       color: Colors.grey[500],
  //                     ),
  //                     contentPadding:
  //                         const EdgeInsets.only(top: 12.0, bottom: 12.0),
  //                   ),
  //                 ),
  //                 SizedBox(height: 40.0),
  //                 InkWell(
  //                   onTap: () {
  //                     Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                             builder: (context) => Home()));
  //                   },
  //                   child: Container(
  //                     padding: EdgeInsets.all(15.0),
  //                     alignment: Alignment.center,
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(5.0),
  //                       color: textColor,
  //                     ),
  //                     child: Text(
  //                       'Forgot Password',
  //                       style: TextStyle(
  //                         fontFamily: 'Signika Negative',
  //                         fontSize: 18.0,
  //                         fontWeight: FontWeight.w700,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  //
  //   return Scaffold(
  //     body: nestedAppBar(),
  //   );
  // }
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
                      'Forget Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
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
                          hintText: 'Email',
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
                            Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: OTPScreen()));
                          },
                          color: Colors.transparent,
                          child: Text(
                            'Request OTP',
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
