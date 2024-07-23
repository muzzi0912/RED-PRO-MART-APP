import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildTotal() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Total', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),
      Text(
        'USD 2054.00',
        style: GoogleFonts.poppins(fontSize: 16, color: Color(0xffe34126)),
      ),
    ],
  );
}