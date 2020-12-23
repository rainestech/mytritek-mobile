import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tritek_lms/appTheme/appTheme.dart';
import 'package:tritek_lms/custom/form.validators.dart';
import 'package:tritek_lms/data/repository/user.repository.dart';
import 'package:tritek_lms/http/user.dart';
import 'package:tritek_lms/pages/common/dialog.dart';
import 'package:tritek_lms/pages/home/home.dart';

class OTPScreen extends StatefulWidget {
  final data;
  final email;
  final mode;

  OTPScreen(this.data, this.email, this.mode);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  var firstController = TextEditingController();
  var secondController = TextEditingController();
  var thirdController = TextEditingController();
  var fourthController = TextEditingController();
  FocusNode secondFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();
  FocusNode fourthFocusNode = FocusNode();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  final UserRepository _repository = UserRepository();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int mode = widget.mode;

    otp() {
      return Container(
        decoration: BoxDecoration(
          color: themeBlue,
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
                      padding: EdgeInsets.only(top: 80.0, left: 20.0),
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
                            appName,
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
                        mode == 1 ?
                        'Email Verification'
                            : 'Password Reset Request',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 90.0),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 25.0, right: 25, bottom: 20),
                      child: Text(
                        'Enter the OTP your received on your registered mobile:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    // OTP Box Start
                    Padding(
                      padding: EdgeInsets.only(left: 50.0, right: 50),
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          // 1 Start
                          Container(
                            width: 50.0,
                            height: 50.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  blurRadius: 1.5,
                                  spreadRadius: 1.5,
                                  color: Colors.grey[200],
                                ),
                              ],
                            ),
                            child: TextFormField(
                              controller: firstController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(18.0),
                                border: InputBorder.none,
                              ),
                              onChanged: (v) {
                                FocusScope.of(context)
                                    .requestFocus(secondFocusNode);
                              },
                              validator: (value) {
                                return Validator.required(value, 0, '');
                              },
                            ),
                          ),
                          // 1 End
                          // 2 Start
                          Container(
                            width: 50.0,
                            height: 50.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  blurRadius: 1.5,
                                  spreadRadius: 1.5,
                                  color: Colors.grey[200],
                                ),
                              ],
                            ),
                            child: TextFormField(
                              focusNode: secondFocusNode,
                              controller: secondController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(18.0),
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                return Validator.required(value, 0, '');
                              },
                              onChanged: (v) {
                                FocusScope.of(context).requestFocus(
                                    thirdFocusNode);
                              },
                            ),
                          ),
                          // 2 End
                          // 3 Start
                          Container(
                            width: 50.0,
                            height: 50.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  blurRadius: 1.5,
                                  spreadRadius: 1.5,
                                  color: Colors.grey[200],
                                ),
                              ],
                            ),
                            child: TextFormField(
                              focusNode: thirdFocusNode,
                              controller: thirdController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(18.0),
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                return Validator.required(value, 0, '');
                              },
                              onChanged: (v) {
                                FocusScope.of(context)
                                    .requestFocus(fourthFocusNode);
                              },
                            ),
                          ),
                          // 3 End
                          // 4 Start
                          Container(
                            width: 50.0,
                            height: 50.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  blurRadius: 1.5,
                                  spreadRadius: 1.5,
                                  color: Colors.grey[200],
                                ),
                              ],
                            ),
                            child: TextFormField(
                              focusNode: fourthFocusNode,
                              controller: fourthController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(18.0),
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                return Validator.required(value, 0, '');
                              },
                              onChanged: (v) {
                                checkPin(v, context);
                              },
                            ),
                          ),
                          // 4 End
                        ],
                      ),
                    ), // OTP Box End
                    SizedBox(height: 40.0),
                    Padding(
                      padding: EdgeInsets.only(left: 50.0, right: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Didn\'t receive OTP Code!',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontFamily: 'Signika Negative',
                              color: Colors.grey[500],
                            ),
                          ),
                          SizedBox(width: 10.0),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Resend',
                              style: TextStyle(
                                fontSize: 13.0,
                                fontFamily: 'Signika Negative',
                                color: themeGold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
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
                            onPressed: () {},
                            color: Colors.transparent,
                            child: Text(
                              'Submit OTP',
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
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: otp(),
    );
  }

  Future<void> checkPin(String v, BuildContext context) async {
    try {
      if (v.length < 1) {
        return;
      }
      String otp = firstController.value.text + secondController.value.text +
          thirdController.value.text + fourthController.value.text;
      if (otp == widget.data) {
        LoadingDialogs.showLoadingDialog(
            context, _keyLoader, 'Processing your details'); //invoking login
        if (widget.mode == 1) {
          UserResponse _response = await _repository.verify(
              otp, widget.email);

          if (_response.error.length > 0) {
            Navigator.of(_keyLoader.currentContext, rootNavigator: true)
                .pop(); //close the dialoge

            ServerValidationDialog.errorDialog(
                context, _response.error, ""); //invoking log
          } else {
            Navigator.of(_keyLoader.currentContext, rootNavigator: true)
                .pop(); //close the dialoge
            Navigator.push(context, PageTransition(
                type: PageTransitionType.rightToLeft,
                child: Home()));
          }
        } else {
          Navigator.of(_keyLoader.currentContext, rootNavigator: true)
              .pop();

          //todo - create reset Password page
          Navigator.push(context, PageTransition(
              type: PageTransitionType.rightToLeft,
              child: Home()));
        }
      } else {
        ServerValidationDialog.errorDialog(
            context, 'Please check again.', 'Invalid input'); //invoking log
      }
    } catch (error) {
      Navigator.of(_keyLoader.currentContext, rootNavigator: true)
          .pop(); //close the dialoge

      ServerValidationDialog.errorDialog(
          context, 'An Error Occurred. Pls try again', ""); //invoking log
    }
  }
}
