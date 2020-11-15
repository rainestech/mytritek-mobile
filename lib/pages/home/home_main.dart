import 'package:flutter/material.dart';
import 'package:tritek_lms/pages/home/home_component/category_list.dart';
import 'package:tritek_lms/pages/home/home_component/instructors_slide.dart';
import 'package:tritek_lms/pages/home/home_component/main_slider.dart';
import 'package:tritek_lms/pages/home/home_component/new_courses.dart';
import 'package:tritek_lms/pages/home/home_component/popular_courses.dart';
import 'package:tritek_lms/pages/home/home_component/subscription_slide.dart';
import 'package:tritek_lms/pages/home/home_component/testimonials_slide.dart';
import 'package:tritek_lms/pages/notifications.dart';
import 'package:tritek_lms/pages/settings/account_settings.dart';

import '../../appTheme/appTheme.dart';
import '../../appTheme/appTheme.dart';

class HomeMain extends StatefulWidget {
  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  @override
  Widget build(BuildContext context) {
    nestedAppBar() {
      return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 120,
              pinned: true,
              backgroundColor: themeBlue,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AccountSettings()));
                    },
                    child: Container(
                      height: 26.0,
                      width: 26.0,
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                          AssetImage('assets/icon.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Tritek Consulting',
                    style: TextStyle(
                      fontFamily: 'Signika Negative',
                      fontWeight: FontWeight.w700,
                      fontSize: 25.0,
                      color: themeGold,
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Notifications()));
                  },
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/appbar_bg.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Available Courses',
                        style: TextStyle(
                          fontFamily: 'Signika Negative',
                          fontWeight: FontWeight.w700,
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AccountSettings()));
                        },
                        child: Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/user_profile/profile.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              automaticallyImplyLeading: false,
            ),
          ];
        },
        body: ListView(
          children: <Widget>[
            MainSlider(),
            SizedBox(height: 10.0),
            SubscriptionSlider(),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  RaisedButton.icon(
                    textColor: Colors.white,
                    color: themeBlue, // .withOpacity(0.9),
                    onPressed: () {
                      // Respond to button press
                    },
                    icon: InkWell(
                      child: Container(
                        height: 30.0,
                        width: 30.0,
                        margin: EdgeInsets.fromLTRB(1.0, 10.0, 1.0, 10.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                            AssetImage('assets/whatsapp.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    label: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Need Help?",
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text("Chat With Us",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: themeGold,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  RaisedButton.icon(
                    textColor: Colors.white,
                    color: themeBlue, // .withOpacity(0.9),
                    onPressed: () {
                      // Respond to button press
                    },
                    icon: InkWell(
                      child: Container(
                        height: 30.0,
                        width: 30.0,
                        margin: EdgeInsets.fromLTRB(1.0, 10.0, 1.0, 10.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                            AssetImage('assets/icon.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    label: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("About Us",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                          color: themeGold,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("Tritek Consulting",
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10.0),
            TestimonialSlider()
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: themeBg,
      body: nestedAppBar(),
    );
  }
}
