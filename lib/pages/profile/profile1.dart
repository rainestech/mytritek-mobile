import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tritek_lms/appTheme/appTheme.dart';
import 'package:tritek_lms/custom/form.validators.dart';
import 'package:tritek_lms/pages/login_signup/login.dart';

class Profile1 extends StatefulWidget {
  @override
  _Profile1State createState() => _Profile1State();
}

class _Profile1State extends State<Profile1> {
  String number = '9603456878';
  String email = 'test@abc.com';
  String username = 'test@abc.com';
  String password = 'test@abc.com';
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  File _image;

  final _formKey = GlobalKey<FormState>();
  FocusNode _usernameFocusNode = FocusNode();
  FocusNode _firstNameFocusNode = FocusNode();
  FocusNode _lastNameFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _phoneNoFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  FocusNode _oldPasswordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    phoneController.text = number;
    emailController.text = email;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    void fieldFocusChange(
        BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }

    editProfile(height) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // return object of type Dialog
          return Dialog(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Form(
              key: _formKey,
              child: Container(
                height: 500,
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Edit Profile",
                      style: TextStyle(
                        color: themeBlue,
                        fontFamily: 'Signika Negative',
                        fontSize: 21.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      focusNode: _lastNameFocusNode,
                      autofocus: true,
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        return Validator.required(
                            value, 1, 'Last Name is required');
                      },
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Signika Negative',
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter Last Name',
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Signika Negative',
                        ),
                      ),
                      onFieldSubmitted: (_) {
                        fieldFocusChange(
                            context, _lastNameFocusNode, _firstNameFocusNode);
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      focusNode: _firstNameFocusNode,
                      autofocus: true,
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        return Validator.username(
                            value, 'First Name is required');
                      },
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Signika Negative',
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter First Name',
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Signika Negative',
                        ),
                      ),
                      onFieldSubmitted: (_) {
                        fieldFocusChange(
                            context, _firstNameFocusNode, _usernameFocusNode);
                      },
                    ),
                    TextFormField(
                      focusNode: _usernameFocusNode,
                      autofocus: true,
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        return Validator.username(value, 'Invalid Username');
                      },
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Signika Negative',
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter Username',
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Signika Negative',
                        ),
                      ),
                      onFieldSubmitted: (_) {
                        fieldFocusChange(
                            context, _usernameFocusNode, _emailFocusNode);
                      },
                    ),
                    TextFormField(
                      focusNode: _emailFocusNode,
                      autofocus: true,
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        return Validator.username(value, 'Invalid Email');
                      },
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Signika Negative',
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter Email',
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Signika Negative',
                        ),
                      ),
                      onFieldSubmitted: (_) {
                        fieldFocusChange(
                            context, _emailFocusNode, _phoneNoFocusNode);
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      focusNode: _phoneNoFocusNode,
                      autofocus: true,
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        return Validator.phone(value, 'Invalid Phone Number');
                      },
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Signika Negative',
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter Phone Number',
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Signika Negative',
                        ),
                      ),
                      onSaved: (phoneNo) => number = phoneNo,
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: (width / 3.5),
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                fontFamily: 'Signika Negative',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              Navigator.pop(context);
                            }
                          },
                          child: Container(
                            width: (width / 3.5),
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: textColor,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              'Okay',
                              style: TextStyle(
                                fontFamily: 'Signika Negative',
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    changePassword() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // return object of type Dialog
          return Dialog(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: 295.0,
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Change Your Password",
                    style: TextStyle(
                      fontFamily: 'Signika Negative',
                      fontSize: 21.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    obscureText: true,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Signika Negative',
                    ),
                    decoration: InputDecoration(
                      hintText: 'Old Password',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Signika Negative',
                      ),
                    ),
                  ),
                  TextField(
                    obscureText: true,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Signika Negative',
                    ),
                    decoration: InputDecoration(
                      hintText: 'New Password',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Signika Negative',
                      ),
                    ),
                  ),
                  TextField(
                    obscureText: true,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Signika Negative',
                    ),
                    decoration: InputDecoration(
                      hintText: 'Confirm New Password',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Signika Negative',
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              fontFamily: 'Signika Negative',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: textColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            'Okay',
                            style: TextStyle(
                              fontFamily: 'Signika Negative',
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    logoutDialogue() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // return object of type Dialog
          return Dialog(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: 130.0,
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "You sure want to logout?",
                    style: TextStyle(
                      fontFamily: 'Signika Negative',
                      fontSize: 21.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              fontFamily: 'Signika Negative',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Login(null, null)));
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: textColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            'Log out',
                            style: TextStyle(
                              fontFamily: 'Signika Negative',
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    _imgFromCamera() async {
      PickedFile image =
          await picker.getImage(source: ImageSource.camera, imageQuality: 50);

      setState(() {
        _image = File(image.path);
      });
    }

    _imgFromGallery() async {
      PickedFile image =
          await picker.getImage(source: ImageSource.gallery, imageQuality: 50);

      setState(() {
        _image = File(image.path);
        // _image = Image.file(File(image.path));
      });
    }

    void _showPicker(context) {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext bc) {
            return SafeArea(
              child: Container(
                child: new Wrap(
                  children: <Widget>[
                    new ListTile(
                        leading: new Icon(Icons.photo_library),
                        title: new Text('Photo Library'),
                        onTap: () {
                          _imgFromGallery();
                          Navigator.of(context).pop();
                        }),
                    new ListTile(
                      leading: new Icon(Icons.photo_camera),
                      title: new Text('Camera'),
                      onTap: () {
                        _imgFromCamera();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            );
          });
    }

    itemTile(width, icon, title, subtitle) {
      return Container(
        width: width,
        padding: EdgeInsets.fromLTRB(30.0, 5, 30, 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 56.0,
                  width: 56.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28.0),
                    color: Colors.grey[300],
                  ),
                  alignment: Alignment.center,
                  child: Icon(icon, size: 28.0, color: themeBlue),
                ),
                SizedBox(width: 12.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: themeBlue,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Container(
              width: width - 30.0,
              height: 1.0,
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              color: Colors.grey[200],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: themeBg,
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 300.0,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 250.0,
                  color: themeBlue,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            _showPicker(context);
                          },
                          child: CircleAvatar(
                            radius: 55,
                            backgroundColor: Color(0xffFDCF09),
                            child: _image != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.file(
                                      _image,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    width: 100,
                                    height: 100,
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Ellison Perry'.toUpperCase(),
                        style: TextStyle(
                          color: themeGold,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 3.0,
                  left: 0.0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        height: 100.0,
                        width: MediaQuery.of(context).size.width - 40.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Courses',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  '160',
                                  style: TextStyle(
                                    color: themeBlue,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Lessons Views',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  '2254',
                                  style: TextStyle(
                                    color: themeBlue,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Quizzes',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  '520',
                                  style: TextStyle(
                                    color: themeBlue,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            padding: EdgeInsets.fromLTRB(20.0, 5, 20, 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Account Info',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        color: themeBlue,
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 56.0,
                      width: 56.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28.0),
                        color: themeBlue,
                      ),
                      alignment: Alignment.center,
                      child: IconButton(
                        onPressed: () {
                          editProfile(height - 400);
                        },
                        iconSize: 48,
                        icon: Icon(Icons.edit, size: 28.0, color: themeGold),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                itemTile(width, Icons.person, 'Username', 'Ellison Perry'),
                itemTile(width, Icons.phone, 'Mobile', '+1 123456789'),
                itemTile(width, Icons.email, 'Email', 'developer@flutter.io'),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      itemTile(width - 100, Icons.lock, 'Password',
                          '\u2022\u2022\u2022\u2022\u2022\u2022\u2022\u2022\u2022\u2022'),
                      // Spacer(),
                      Container(
                        height: 56.0,
                        width: 56.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28.0),
                          color: themeBlue,
                        ),
                        alignment: Alignment.center,
                        child: IconButton(
                          onPressed: () {
                            changePassword();
                          },
                          iconSize: 48,
                          icon:
                              Icon(Icons.warning, size: 28.0, color: themeGold),
                        ),
                      ),
                    ])
              ],
            ),
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(30.0),
              child: Material(
                elevation: 1.0,
                borderRadius: BorderRadius.circular(30.0),
                child: Container(
                  padding: EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: themeGold,
                  ),
                  child: Text(
                    'Logout'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10)
        ],
      ),
    );
  }

  profileTile(icon, title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Color(0xFF0BC9E3),
            size: 28.0,
          ),
          SizedBox(width: 10.0),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          )
        ],
      ),
    );
  }
}
