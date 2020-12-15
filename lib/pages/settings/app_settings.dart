import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:tritek_lms/appTheme/appTheme.dart';

class AppSettings extends StatefulWidget {
  @override
  _AppSettingsState createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  bool status = false;
  bool notifications = false;
  bool standard = true;
  bool high = false;
  bool delete = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    Container getDivider(Color color) {
      return Container(
        height: 1.0,
        width: width,
        margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
        color: color,
      );
    }

    deleteLesson() {
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
              height: 280.0,
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Nothing to Delete",
                    style: TextStyle(
                      fontFamily: 'Signika Negative',
                      fontSize: 21.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.red[400],
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Icon(
                    Icons.hourglass_empty,
                    size: 60.0,
                    color: textColor,
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    'There are no downloaded lessons on your device',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Signika Negative',
                      fontSize: 15.0,
                      color: Colors.grey[400],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    child: Container(
                      width: width - 40.0,
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
            ),
          );
        },
      );
    }

    nestedAppBar() {
      return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 150,
              backgroundColor: themeBlue,
              pinned: true,
              leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: themeGold,),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              flexibleSpace: LayoutBuilder(builder:
                  (BuildContext context, BoxConstraints constraints) {
                // top = constraints.biggest.height;
                return FlexibleSpaceBar(
                    centerTitle: false,
                    title: AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      //opacity: top == 80.0 ? 1.0 : 0.0,
                      opacity: 1.0,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 20, 0),
                        alignment: Alignment.bottomLeft,
                        decoration: BoxDecoration(
                          color: themeBlue,
                        ),
                        child: Text(
                          'App Settings',
                          style: TextStyle(
                            fontFamily: 'Signika Negative',
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                            color: themeGold,
                          ),
                        ),
                      ),
                    ),
                    background: Container(
                      padding: EdgeInsets.all(20.0),
                      alignment: Alignment.bottomLeft,
                      decoration: BoxDecoration(
                          color: themeBlue
                      ),
                    ));
              }),
              automaticallyImplyLeading: false,
            ),
          ];
        },
        body: ListView(
          children: <Widget>[
            SizedBox(height: 15.0),
            Container(
              margin: EdgeInsets.only(right: 20.0, left: 20.0),
              width: width - 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Cellular Data',
                    style: TextStyle(
                      color: themeBlue,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Signika Negative',
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Cellular Data for Videos',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Signika Negative',
                        ),
                      ),
                      CustomSwitch(
                        activeColor: textColor,
                        value: status,
                        onChanged: (value) {
                          setState(() {
                            status = value;
                          });
                        },
                      ),
                    ],
                  ),
                  getDivider(Colors.grey[300]),
                  SizedBox(height: 10.0),
                  Text(
                    'Video Quality',
                    style: TextStyle(
                      color: themeBlue,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Signika Negative',
                    ),
                  ),
                  SizedBox(height: 15.0),
                  InkWell(
                    onTap: () {
                      setState(() {
                        standard = true;
                        high = false;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Standard (recommended)',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Signika Negative',
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Load faster and uses less data',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[400],
                                fontFamily: 'Signika Negative',
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          (standard) ? Icons.check : null,
                          size: 25.0,
                        ),
                      ],
                    ),
                  ),
                  getDivider(Colors.grey[300]),
                  InkWell(
                    onTap: () {
                      setState(() {
                        standard = false;
                        high = true;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'High Definition',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Signika Negative',
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Use more data',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[400],
                                fontFamily: 'Signika Negative',
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          (high) ? Icons.check : null,
                          size: 25.0,
                        ),
                      ],
                    ),
                  ),
                  getDivider(Colors.grey[300]),
                  SizedBox(height: 10.0),
                  Text(
                    'Notifications',
                    style: TextStyle(
                      color: themeBlue,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Signika Negative',
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Turn on Daily Notifications',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Signika Negative',
                        ),
                      ),
                      CustomSwitch(
                        activeColor: textColor,
                        value: notifications,
                        onChanged: (value) {
                          setState(() {
                            notifications = value;
                          });
                        },
                      ),
                    ],
                  ),
                  getDivider(Colors.grey[300]),
                  InkWell(
                    onTap: () {
                      setState(() {
                        standard = false;
                        high = true;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Notification Time',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Signika Negative',
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              '9:00 am',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[400],
                                fontFamily: 'Signika Negative',
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          (high) ? Icons.check : null,
                          size: 25.0,
                        ),
                      ],
                    ),
                  ),
                  getDivider(Colors.grey[300]),

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
