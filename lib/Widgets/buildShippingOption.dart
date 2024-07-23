import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildShippingOption() {
  return Container(
    height: 80,
    padding: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Express', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),

            Text('USD 50.00', style: GoogleFonts.poppins(fontSize: 13)),
          ],
        ),
        Text('Estimated arrived 9 - 10 June', style: GoogleFonts.poppins(color: Colors.grey)),

      ],
    ),
  );
}