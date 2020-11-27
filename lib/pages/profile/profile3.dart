import 'package:flutter/material.dart';

class Profile3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 350.0,
                width: width,
                color: Colors.white,
                alignment: Alignment.topLeft,
                child: Container(
                  height: 320.0,
                  width: width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [0.1, 1.0],
                      colors: [
                        Colors.red[400],
                        Colors.orange[300],
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          image: DecorationImage(
                            image: AssetImage('assets/user.jpg'),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              blurRadius: 1.0,
                              spreadRadius: 1.0,
                              color: Colors.grey[400],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        '@ellisonperry',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'developer@flutter.io',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    borderRadius: BorderRadius.circular(30.0),
                    child: Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(30.0),
                      child: Container(
                        width: width - 80.0,
                        height: 60.0,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            stops: [0.1, 1.0],
                            colors: [
                              Colors.pink[600],
                              Colors.indigo[400],
                            ],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 40.0,
                              width: 40.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white,
                              ),
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.pink,
                              ),
                            ),
                            Text(
                              'Back to\nHome',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10.0, height: 10.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Account Info',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                itemTile(width, Icons.person, 'Name', 'Ellison Perry'),
                itemTile(width, Icons.phone, 'Mobile', '+1 123456789'),
                itemTile(width, Icons.email, 'Email', 'developer@flutter.io'),
                itemTile(width, Icons.location_city, 'Address',
                    'Avenue 2nd Street NW SY.'),
                itemTile(width, Icons.date_range, 'D.O.B.', '26-06-1995'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  itemTile(width, icon, title, subtitle) {
    return Container(
      padding: EdgeInsets.all(10.0),
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
                child: Icon(icon, size: 28.0, color: Colors.indigo[500]),
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
                        color: Colors.indigo[500],
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
}
