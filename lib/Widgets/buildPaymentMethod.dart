
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';

Widget buildPaymentMethod({
  required IconData icon,
  required String title,
  required String description,
  required bool isSelected,
  required Function onTap,
}) {
  return InkWell(
    onTap: () {
      onTap();
    },
    child: Container(
      width: 180, // Adjust width of the card
      height: 120,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Constants.mainAppColor : Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(8),
        color: isSelected ? Colors.orange.shade50 : Colors.transparent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: isSelected ? Constants.mainAppColor : Colors.grey,
                size: 30,
              ),
              SizedBox(height: 5, width: 8),
              Text(
                title,
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(
            description,
            style: GoogleFonts.poppins(color: Colors.grey, fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}