import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildShippingAddress() {
  return Container(
    padding: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.location_on, color: Color(0xffe34126)),
            SizedBox(width: 8),
            Text(
              'Shipping Address',
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          '5678 Oakwood Avenue, Apt 12B, Greenwood Heights, Brooklyn, Kings County, New York, NY 11232, United States',
          style: GoogleFonts.poppins(fontSize: 12),
        ),
        SizedBox(height: 8),
        Text(
          'Albert Williams   +1 (0800) 245 5687',
          style: GoogleFonts.poppins(fontSize: 12),
        ),
      ],
    ),
  );
}
