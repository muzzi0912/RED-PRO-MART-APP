import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildAddressSection(IconData icon, String title, String address, BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;

  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(icon, color: Color(0xffe34126)),
      SizedBox(width: screenWidth * 0.02),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: GoogleFonts.poppins(fontSize: screenWidth * 0.03, color: Colors.grey)),
            SizedBox(height: 4),
            Text(address, style: GoogleFonts.poppins(fontSize: screenWidth * 0.03)),
          ],
        ),
      ),
    ],
  );
}