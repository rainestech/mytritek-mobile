import 'package:flutter/material.dart';
import 'package:tritek_lms/pages/profile/profile1.dart';
import 'package:tritek_lms/pages/profile/profile2.dart';
import 'package:tritek_lms/pages/profile/profile3.dart';
import 'package:tritek_lms/pages/profile/profile4.dart';
import 'package:tritek_lms/pages/profile/profile5.dart';

class ProfileHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        titleSpacing: 0.0,
        centerTitle: true,
        title: Text(
          'Profile Screen',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile1()));
            },
            child: itemTile(Colors.red, 'Profile 1'),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile2()));
            },
            child: itemTile(Colors.indigo, 'Profile 2'),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile3()));
            },
            child: itemTile(Colors.pink, 'Profile 3'),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile4()));
            },
            child: itemTile(Colors.orange, 'Profile 4'),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile5()));
            },
            child: itemTile(Colors.blueGrey, 'Profile 5'),
          ),
          SizedBox(height: 15.0),
        ],
      ),
    );
  }

  itemTile(color, title) {
    return Container(
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.only(
        top: 15.0,
        right: 15.0,
        left: 15.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 1.0,
            spreadRadius: 1.0,
            color: Colors.grey[300],
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: color,
            ),
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 20.0,
            ),
          ),
          SizedBox(width: 10.0),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
