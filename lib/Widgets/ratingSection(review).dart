import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildRatingSection(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Your Overall Rating',
        style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04),
      ),
      SizedBox(height: MediaQuery.of(context).size.height * 0.01),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.star,
              color: Colors.orange,
              size: MediaQuery.of(context).size.width * 0.09),
          Icon(Icons.star,
              color: Colors.orange,
              size: MediaQuery.of(context).size.width * 0.09),
          Icon(Icons.star,
              color: Colors.orange,
              size: MediaQuery.of(context).size.width * 0.09),
          Icon(Icons.star,
              color: Colors.orange,
              size: MediaQuery.of(context).size.width * 0.09),
          Icon(Icons.star_border,
              color: Colors.orange,
              size: MediaQuery.of(context).size.width * 0.09),
        ],
      ),
    ],
  );
}