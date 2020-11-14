import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tritek_lms/appTheme/appTheme.dart';
class SubscriptionSlider extends StatefulWidget {
  @override
  _SubscriptionSlider createState() => _SubscriptionSlider();
}

class _SubscriptionSlider extends State<SubscriptionSlider> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: 190.0,
      color: Theme.of(context).appBarTheme.color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              'Membership/Subscription',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: themeGold,
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Signika Negative',
                letterSpacing: 0.7,
              ),
            ),
          ),
          Container(
            height: 150.0,
            child: FutureBuilder<List<SubscriptionList>>(
              future: loadProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);

                return snapshot.hasData
                    ? ListView.builder(
                        itemCount: snapshot.data.length,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
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
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 5.0),
                                    Text(
                                      snapshot.data[index].name,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    for(var item in snapshot.data[index].properties )
                                      Text(
                                        item.length > 0 ? "\u2022 " + item : "",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    SizedBox(height: 5.0),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Price: ' + '\$${snapshot.data[index].price}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: themeGold,
                                            fontSize: 14.0,
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
          ),
        ],
      ),
    );
  }
}

class SubscriptionList {
  int id;
  String name;
  String price;
  List properties;

  SubscriptionList(this.id, this.name, this.price, this.properties);
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

class MyBullet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 10.0,
      width: 10.0,
      decoration: new BoxDecoration(
        color: themeGold,
        shape: BoxShape.circle,
      ),
    );
  }
}
