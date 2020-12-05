import 'package:flutter/material.dart';
import 'package:tritek_lms/appTheme/appTheme.dart';
import 'package:tritek_lms/pages/settings/account.settings.dart';
import 'package:tritek_lms/pages/settings/app_settings.dart';
import 'package:tritek_lms/pages/settings/inapp.webview.dart';
import 'package:tritek_lms/pages/settings/membership.settings.dart';
import 'package:tritek_lms/pages/settings/progress.settings.dart';
import 'package:tritek_lms/pages/settings/webview.navoff.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    nestedAppBar() {
      return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 150,
              backgroundColor: themeBlue,
              pinned: true,
              flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                // print('constraints=' + constraints.toString());
                return FlexibleSpaceBar(
                    centerTitle: false,
                    title: AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      //opacity: top == 80.0 ? 1.0 : 0.0,
                      opacity: 1.0,
                      child: Text(
                        'Settings',
                        style: TextStyle(
                          fontFamily: 'Signika Negative',
                          fontWeight: FontWeight.w700,
                          color: themeGold,
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                    background: Container(
                      padding: EdgeInsets.all(20.0),
                      alignment: Alignment.bottomLeft,
                      decoration: BoxDecoration(color: themeBlue),
                    ));
              }),
              automaticallyImplyLeading: false,
            ),
          ];
        },
        body: ListView(
          children: <Widget>[
            SizedBox(height: 20.0),
            Container(
              margin: EdgeInsets.only(right: 15.0, left: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AccountSettings()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Account Settings',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: themeBlue,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Signika Negative'),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 18.0,
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 20.0),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MembershipSettings()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Membership Settings',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: themeBlue,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Signika Negative'),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 18.0,
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 20.0),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Progress()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Progress Tracker',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: themeBlue,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Signika Negative'),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 18.0,
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 20.0),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AppSettings()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'App Settings',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                              color: themeBlue,
                              fontFamily: 'Signika Negative'),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 18.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NoNavWebView(
                                  'https://mytritek.co.uk/about-us')));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'About Us',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                              color: themeBlue,
                              fontFamily: 'Signika Negative'),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 18.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NoNavWebView(
                                  'https://mytritek.co.uk/terms-and-conditions/')));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Terms & Conditions',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                              color: themeBlue,
                              fontFamily: 'Signika Negative'),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 18.0,
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 20.0),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WebviewInApp('')));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Contact Us',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                              color: themeBlue,
                              fontFamily: 'Signika Negative'),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 18.0,
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: nestedAppBar(),
    );
  }
}
