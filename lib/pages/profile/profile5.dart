import 'package:flutter/material.dart';

class Profile5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                  ),
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ellison Perry',
                        style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00145E),
                        ),
                      ),
                      SizedBox(height: 7.0),
                      Text(
                        'Fashion Model',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF838DAF),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          personalDetailItem(Icons.phone, '(581)-307-6902'),
          SizedBox(height: 20.0),
          personalDetailItem(Icons.email, 'model@abcfashion.com'),
          SizedBox(height: 20.0),
          divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: (width - 1.0) / 2.0,
                height: 100.0,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '\$140.00',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Color(0xFF00145E),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 7.0),
                    Text(
                      'Wallet',
                      style: TextStyle(
                        fontSize: 17.0,
                        color: Color(0xFF838DAF),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 1.0,
                height: 100.0,
                color: Colors.grey[300],
              ),
              Container(
                width: (width - 1.0) / 2.0,
                height: 100.0,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '12',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Color(0xFF00145E),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 7.0),
                    Text(
                      'Orders',
                      style: TextStyle(
                        fontSize: 17.0,
                        color: Color(0xFF838DAF),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          divider(),
          listItem(Icons.favorite_border, 'Your Favorites'),
          listItem(Icons.account_balance_wallet, 'Payment'),
          listItem(Icons.group, 'Tell Your Friend'),
          listItem(Icons.local_offer, 'Promotions'),
          listItem(Icons.settings, 'Settings'),
          divider(),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.exit_to_app,
                    size: 24.0,
                    color: Colors.red,
                  ),
                  SizedBox(width: 20.0),
                  Text(
                    'Log out',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  divider() {
    return Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[300],
    );
  }

  personalDetailItem(icon, text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Color(0xFF838DAF),
            size: 22.0,
          ),
          SizedBox(width: 20.0),
          Text(
            text,
            style: TextStyle(
              color: Color(0xFF838DAF),
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }

  listItem(icon, text) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 24.0,
              color: Color(0xFF386FFA),
            ),
            SizedBox(width: 20.0),
            Text(
              text,
              style: TextStyle(
                color: Color(0xFF00145E),
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
