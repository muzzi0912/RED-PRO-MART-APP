import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildReviewSection(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Add Detail Review',
        style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.03),
      ),
      SizedBox(height: MediaQuery.of(context).size.height * 0.01),
      TextField(
        maxLines: 4,
        decoration: InputDecoration(
          hintText: 'Enter here',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    ],
  );
}