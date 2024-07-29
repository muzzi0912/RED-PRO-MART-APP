import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redpro_mart/screens/paymentSuccessScreen.dart';

import '../Widgets/buildAddressSectionWidget.dart';
import '../Widgets/buildTimeLineStepWidget.dart';
import '../Widgets/buildWeightSection.dart';
import '../Widgets/trackingTimelineStep.dart';
import 'CheckoutScreen.dart';
import 'OrderHistory.dart';

class TrackingDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title:  Text(
        "Tracking Detail",
        style: GoogleFonts.poppins(fontSize: screenWidth * 0.06),
      ),centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PaymentSuccessfulScreen()),
            );
          },
          child: Image.asset(
            'assets/backButton.png',
            height: screenHeight * 0.03,
            width: screenWidth * 0.09,
          ),
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(CupertinoIcons.bag),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            'assets/banana.png',
                            height: screenHeight * 0.12,
                            width: screenWidth * 0.25,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(screenWidth * 0.02),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Freshly Harvested Bananas - Perfectly Ripe and Naturally Sweet.',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        fontSize: screenWidth * 0.03,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                      style: GoogleFonts.poppins(
                                        color: Colors.grey,
                                        fontSize: screenWidth * 0.025,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Row(
                                children: [
                                  Text(
                                    'Order ID:',
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: screenWidth * 0.025,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '12685231654684',
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: screenWidth * 0.025,
                                    ),
                                  ),
                                  SizedBox(width: screenWidth * 0.02),
                                  GestureDetector(
                                    onTap: () {
                                      Clipboard.setData(ClipboardData(text: '12685231654684')).then((_) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('Tracking ID copied to clipboard!')),
                                        );
                                      });
                                    },
                                    child: SizedBox(
                                      height: screenHeight * 0.02,
                                      width: screenWidth * 0.04,
                                      child: Image.asset(
                                        'assets/save.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(height: screenHeight * 0.04),
                  buildAddressSection(Icons.location_on_outlined, 'From',
                      '5678 Oakwood Avenue, Apt 12B, Greenwood Heights, Brooklyn, Kings County, New York, NY 11232, United States', context),
                  SizedBox(height: screenHeight * 0.04),
                  buildAddressSection(Icons.local_shipping_outlined, 'Send to',
                      '5678 Oakwood Avenue, Apt 12B, Greenwood Heights, Brooklyn, Kings County, New York, NY 11232, United States', context),
                  SizedBox(height: screenHeight * 0.04),
                  buildWeightSection(context),
                  Divider(height: screenHeight * 0.04),
                  buildTrackingTimeline(context),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OrderHistoryScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xffe34126),
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            'Live Tracking',
            style: GoogleFonts.poppins(fontSize: screenWidth * 0.045, color: Colors.white),
          ),
        ),
      ),
    );
  }








}
