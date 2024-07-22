import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildTimelineStep({
  required bool isActive,
  required bool isCompleted,
  required String title,
  required String description,
  required String date,
  required String time,
  required BuildContext context,
}) {
  final screenWidth = MediaQuery.of(context).size.width;

  return Row(
    children: [
      Column(
        children: [
          Container(
            height: screenWidth * 0.05,
            width: screenWidth * 0.05,
            decoration: BoxDecoration(
              color: Color(0xffe3c2c2),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.0125),
              child: Container(
                height: screenWidth * 0.05,
                width: screenWidth * 0.05,
                decoration: BoxDecoration(
                  color: isCompleted ? Color(0xffe34126) : Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Container(
            height: isActive ? screenWidth * 0.13 : 0,
            width: screenWidth * 0.005,
            color: isActive ? Color(0xffe34126) : Colors.grey,
          ),
        ],
      ),
      SizedBox(width: screenWidth * 0.02),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
            Text(description),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(date),
                Text(time),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}