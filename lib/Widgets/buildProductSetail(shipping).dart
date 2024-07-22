
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildProductDetails() {
  return Row(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          'assets/banana.png',
          height: 70,
          width: 70,
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(width: 16),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Freshly Harvested Bananas - Perfectly Ripe and Naturally Sweet.',
              style: GoogleFonts.poppins(fontSize: 11),
            ),
            SizedBox(height: 8),
            Text(
              'USD 150.00',
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('x1', style: GoogleFonts.poppins(fontSize: 16)),
      ),
    ],
  );
}