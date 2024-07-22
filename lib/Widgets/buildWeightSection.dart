import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildWeightSection(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;

  return Row(
    children: [
      Icon(CupertinoIcons.bag, color: Color(0xffe34126)),
      SizedBox(width: screenWidth * 0.02),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Weight', style: GoogleFonts.poppins(color: Colors.grey, fontSize: screenWidth * 0.03)),
          SizedBox(height: 4),
          Text('3.5 Kg', style: GoogleFonts.poppins(fontSize: screenWidth * 0.03)),
        ],
      ),
    ],
  );
}