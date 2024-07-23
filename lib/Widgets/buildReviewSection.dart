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
      TextField(cursorColor: Colors.black,
        maxLines: 4,
        decoration: InputDecoration(

          hintText: 'Enter here',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
  focusedBorder: OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: BorderSide(
  color: Colors.black,
        ),
      ),
  ))],
  );
}