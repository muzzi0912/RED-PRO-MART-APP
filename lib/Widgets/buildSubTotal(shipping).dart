import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildSubtotal() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Note:', style: GoogleFonts.poppins(color: Colors.black)),
          SizedBox(width: 200),
          Expanded(
            child: TextField(cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'Type any message...',
                hintStyle: GoogleFonts.poppins(color: Colors.grey),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
              style: GoogleFonts.poppins(color: Colors.black),
            ),
          ),
        ],
      ),
      SizedBox(height: 16),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Subtotal, 1 items', style: GoogleFonts.poppins()),
          Text(
            'USD 254.00',
            style: GoogleFonts.poppins(fontSize: 16, color: Color(0xffe34126)),
          ),
        ],
      ),
    ],
  );
}