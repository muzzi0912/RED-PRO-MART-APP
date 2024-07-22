import 'package:flutter/material.dart';

class ResponsiveUtil {
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
  static double getFontSize(BuildContext context, double baseSize) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth <= 480) {
      return baseSize * 0.8; // Small screens
    } else if (screenWidth <= 768) {
      return baseSize * 0.9; // Medium screens
    } else if (screenWidth <= 1024) {
      return baseSize; // Large screens
    } else {
      return baseSize * 1.1; // Extra large screens
    }
  }

  static EdgeInsets getPadding(BuildContext context, EdgeInsets basePadding) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth <= 480) {
      return basePadding * 0.8; // Small screens
    } else if (screenWidth <= 768) {
      return basePadding * 0.9; // Medium screens
    } else if (screenWidth <= 1024) {
      return basePadding; // Large screens
    } else {
      return basePadding * 1.1; // Extra large screens
    }
  }

  static bool isSmallScreen(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth <= 480;
  }

  static bool isMediumScreen(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 480 && screenWidth <= 768;
  }

  static bool isLargeScreen(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 768 && screenWidth <= 1024;
  }

  static bool isExtraLargeScreen(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 1024;
  }
}
