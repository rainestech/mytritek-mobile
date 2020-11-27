import 'package:flutter/material.dart';

class Profile2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Positioned(
                top: 0.0,
                left: 0.0,
                child: Container(
                  width: width,
                  height: 200.0,
                  color: Colors.green,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0.0),
                      child: Material(
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          width: width - 40.0,
                          padding: EdgeInsets.fromLTRB(10.0, 60.0, 10.0, 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Ellison Perry',
                                style: TextStyle(
                                  fontSize: 22.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Full Stack Developer, Flutter, UI',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'I love fantastic things, colors and good design. I create the software that make live better. Hire me for your next project :)',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'New York, USA.',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
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
          SizedBox(height: 25.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '9.8',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'Rating',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '178',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'Projects',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(5.0),
                  child: Container(
                    width: (width - 40.0 - 10.0 - 8.0) / 2.0,
                    padding: EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.indigo, width: 2.0),
                    ),
                    child: Text(
                      'Portfolio'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(5.0),
                  child: Container(
                    width: (width - 40.0 - 10.0 - 8.0) / 2.0,
                    padding: EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.green, width: 2.0),
                    ),
                    child: Text(
                      'Hire Me'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25.0),
        ],
      ),
    );
  }
}
