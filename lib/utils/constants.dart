import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const Color buttonColor = Color(0xFFED4226);
  static const Color textColor = Color(0xFFED4226);
  static const Color sliderColor = Color(0xFFED4226);
  static const Color mainAppColor = Color(0xFFED4226);
  static double screenWidth(BuildContext context) {
    return MediaQuery
        .of(context)
        .size
        .width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery
        .of(context)
        .size
        .height;
  }

  static double screenHeightFraction(BuildContext context, double fraction) {
    return MediaQuery
        .of(context)
        .size
        .height * fraction;
  }

  static double screenWidthFraction(BuildContext context, double fraction) {
    return MediaQuery
        .of(context)
        .size
        .width * fraction;
  }

  static TextStyle poppins({
    double fontSize = 14.0,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}

