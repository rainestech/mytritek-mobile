import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tritek_lms/appTheme/appTheme.dart';
import 'package:tritek_lms/pages/home/home.dart';
import 'package:tritek_lms/pages/home/home_component/subscription_slide.dart';

class SelectPlan extends StatefulWidget {
  final String courseName, image, price;
  SelectPlan({Key key, this.courseName, this.image, this.price})
      : super(key: key);
  @override
  _SelectPlanState createState() => _SelectPlanState();
}

class _SelectPlanState extends State<SelectPlan> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    String courseName = widget.courseName;
    String courseImage = widget.image;
    String coursePrice = widget.price;

    thanksDialog() {
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
              height: 200.0,
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 70.0,
                    width: 70.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.0),
                      border: Border.all(color: textColor, width: 1.0),
                    ),
                    child: Icon(
                      Icons.check,
                      size: 40.0,
                      color: textColor,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Thanks for purchasing!",
                    style: TextStyle(
                      fontFamily: 'Signika Negative',
                      fontSize: 21.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[400],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          );
        },
      );

      Future.delayed(const Duration(milliseconds: 3000), () {
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        });
      });
    }

    paymentMethodDialog() {
      int selectedRadioPayment = 0;

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // return object of type Dialog
          return StatefulBuilder(
            builder: (context, setState) {
              setSelectedRadioPayment(int val) {
                setState(() {
                  selectedRadioPayment = val;
                });
              }

              return Dialog(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Container(
                  height: 400.0,
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Choose payment method",
                        style: TextStyle(
                          fontFamily: 'Signika Negative',
                          fontSize: 21.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        width: width - 40.0,
                        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: RadioListTile(
                          value: 0,
                          groupValue: selectedRadioPayment,
                          title: Text(
                            "Credit / Debit Card",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          onChanged: (val) {
                            setSelectedRadioPayment(val);
                          },
                          activeColor: textColor,
                          secondary: Image(
                            image: AssetImage(
                              'assets/payment_icon/card.png',
                            ),
                            height: 45.0,
                            width: 45.0,
                          ),
                        ),
                      ),
                      Divider(
                        height: 1.0,
                      ),
                      Container(
                        width: width - 40.0,
                        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: RadioListTile(
                          value: 3,
                          groupValue: selectedRadioPayment,
                          title: Text(
                            "PayPal",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          onChanged: (val) {
                            setSelectedRadioPayment(val);
                          },
                          activeColor: textColor,
                          secondary: Image(
                            image: AssetImage(
                              'assets/payment_icon/paypal.png',
                            ),
                            height: 40.0,
                            width: 40.0,
                          ),
                        ),
                      ),
                      Divider(
                        height: 1.0,
                      ),
                      Container(
                        width: width - 40.0,
                        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: RadioListTile(
                          value: 4,
                          groupValue: selectedRadioPayment,
                          title: Text(
                            "Google Wallet",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          onChanged: (val) {
                            setSelectedRadioPayment(val);
                          },
                          activeColor: textColor,
                          secondary: Image(
                            image: AssetImage(
                              'assets/payment_icon/google_wallet.png',
                            ),
                            height: 40.0,
                            width: 40.0,
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
                              thanksDialog();
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
                                'Pay',
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
        },
      );
    }

    nestedAppBar() {
      return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 150.0,
              pinned: true,
              forceElevated: true,
              automaticallyImplyLeading: false,
              backgroundColor: themeBlue,
              elevation: 0.0,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: iconColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'Back',
                    style: TextStyle(
                      fontFamily: 'Signika Negative',
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0,
                      color: themeGold,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => AccountSettings()));
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
                    'MyTritek',
                    style: TextStyle(
                      fontFamily: 'Signika Negative',
                      fontWeight: FontWeight.w700,
                      fontSize: 25.0,
                      color: themeGold,
                    ),
                  ),
                ],
              ),
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
                      AutoSizeText(
                        'Membership/Subscriptions',
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: 'Signika Negative',
                          fontWeight: FontWeight.w700,
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => AccountSettings()));
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
            ),
          ];
        },
        body: FutureBuilder<List<SubscriptionList>>(
          future: loadProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? ListView.builder(
                itemCount: snapshot.data.length,
                primary: false,
                itemBuilder: (BuildContext ctxt, int index) {
                  return InkWell(
                    onTap: () {
                      // ....
                    },
                    child: Container(
                      // width: 230.0,
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: themeBlue,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2.0,
                            spreadRadius: 1.5,
                            color: Colors.grey[300],
                          )
                        ],
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20.0, 1.0, 20.0, 2.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(height: 5.0),
                            AutoSizeText(
                              snapshot.data[index].name,
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            for(var item in snapshot.data[index].properties )
                              AutoSizeText(
                                item.length > 0 ? "\u2022 " + item : "",
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            SizedBox(height: 5.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Price: ' + '\$${snapshot.data[index].price}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: themeGold,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                })
                : Center(
                    child: SpinKitRipple(color: Colors.red),
                );
          },
        ),
      );
    }

    AppBar buildAppBar(BuildContext context) {
      return AppBar(
        backgroundColor: themeBlue,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: iconColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: false,
        title: Text(
          'Back'.toUpperCase(),
          style: Theme.of(context).textTheme.bodyText2,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: iconColor,
            ),
            onPressed: () {},
          ),
        ],
      );
    }

    return Scaffold(
      body: nestedAppBar(),
      backgroundColor: themeBg,
    );
  }

  Future<List<SubscriptionList>> loadProducts() async {
    var jsonString = await rootBundle.loadString('assets/json/subscription_slide.json');
    final jsonResponse = json.decode(jsonString);

    List<SubscriptionList> subs = [];

    for (var o in jsonResponse) {
      SubscriptionList course = SubscriptionList(
          o["id"],
          o["name"],
          o["price"],
          o["properties"]);

      subs.add(course);
    }

    return subs;
  }

  Future<List<String>> loadProperties(List property) async {
    // List<String> subs = [];
    //
    // for (var o in property) {
    //   subs.add(o);
    // }

    return property;
  }
}

