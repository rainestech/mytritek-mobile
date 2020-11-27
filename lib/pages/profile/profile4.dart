import 'package:flutter/material.dart';

class Profile4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFF7F8FA),
      bottomNavigationBar: Container(
        width: width,
        height: 70.0,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                width: 90.0,
                height: 50.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFFF7F8FA),
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(width: 1.0, color: Colors.grey[400]),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      blurRadius: 1.0,
                      spreadRadius: 1.0,
                      color: Colors.grey[200],
                    ),
                  ],
                ),
                child: Icon(
                  Icons.keyboard_backspace,
                  color: Colors.black,
                  size: 30.0,
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.pop(context),
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                height: 50.0,
                width: width - 90.0 - 40.0 - 20.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.indigo[500]),
                child: Text(
                  'Save'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: width,
                height: 260.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/profile4_bg.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 70.0, left: 20.0),
                child: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 35.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 140.0),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0.0),
                      child: Material(
                        elevation: 1.3,
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          width: width - 40.0,
                          padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.settings),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                              SizedBox(height: 15.0),
                              Text(
                                'Ellison Perry',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 7.0),
                              Text(
                                'developer@flutter.io',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Divider(
                                color: Colors.grey[400],
                                height: 20.0,
                              ),
                              SizedBox(height: 10.0),
                              listTile(Icons.folder, 'My projects'),
                              SizedBox(height: 20.0),
                              listTile(Icons.person, 'Account'),
                              SizedBox(height: 20.0),
                              listTile(Icons.share, 'Share with friends'),
                              SizedBox(height: 20.0),
                              listTile(Icons.star, 'Review'),
                              SizedBox(height: 20.0),
                              listTile(Icons.info, 'Info'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0.0,
                      child: Container(
                        width: width,
                        color: Colors.transparent,
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: 120.0,
                          height: 120.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60.0),
                            border: Border.all(width: 2.0, color: Colors.white),
                            image: DecorationImage(
                              image: AssetImage('assets/user.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  listTile(icon, title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, size: 28.0, color: Colors.grey),
              SizedBox(width: 10.0),
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Icon(Icons.keyboard_arrow_right, color: Colors.grey, size: 28.0),
        ],
      ),
    );
  }
}
