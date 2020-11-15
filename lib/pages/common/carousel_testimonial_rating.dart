import 'dart:ui';

import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tritek_lms/appTheme/appTheme.dart';

class CarouselTestimonial extends StatelessWidget {
  final testimony;
  final name;
  final width;
  final image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) => ProductListView()));
      },
      child: Container(
        width: width,
        height: 120,
        margin: EdgeInsets.all(0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            InkWell(
              child: Container(
                height: 90.0,
                width: 90.0,
                margin: EdgeInsets.fromLTRB(20, 10, 5, 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image:
                    AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Spacer(),
            Bubble(
              margin: BubbleEdges.all(0),
              nip: BubbleNip.leftTop,
              color: Color(0xFFBDBDBD),
              // color: themeBlue.withOpacity(0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(name,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: themeBlue,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2.0),
                  Container (
                    padding: EdgeInsets.all(1.0),
                    width: (width - 160),
                    // height: 70,
                    child:
                    Text(testimony,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                      ),
                        ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  CarouselTestimonial(this.width, this.name, this.testimony, this.image);
}