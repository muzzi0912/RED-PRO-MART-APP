import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'dart:ui'; // For BackdropFilter

import 'ShippingScreen.dart';
import 'TrackingDetailScreen.dart';

class PaymentSuccessfulScreen extends StatefulWidget {
  @override
  _PaymentSuccessfulScreenState createState() =>
      _PaymentSuccessfulScreenState();
}

class _PaymentSuccessfulScreenState extends State<PaymentSuccessfulScreen> {
  bool _isEReceiptVisible = false; // To control the visibility of the e-receipt

  void _showEReceipt() {
    setState(() {
      _isEReceiptVisible = true;
    });
  }

  void _hideEReceipt() {
    setState(() {
      _isEReceiptVisible = false;
    });
  }

  void _showToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "The receipt has been saved to your gallery.",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: 'Poppins', // Replace with your preferred font
          ),
        ),
        backgroundColor: Colors.black.withOpacity(0.8), // Semi-transparent black background
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)), // Rounded top corners
        ),
        duration: Duration(seconds: 2), // Duration equivalent to Toast.LENGTH_SHORT
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Payment',
          style: GoogleFonts.poppins(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0.0,
        leading: IconButton(
          icon: Image.asset(
            'assets/backButton.png', // Replace with your back button image path
            height: 30,
            width: 30,
          ),
          onPressed: () {
            Navigator.pop(context); // Close the current screen
          },
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(CupertinoIcons.bag),
        //     onPressed: () {},
        //     style: TextButton.styleFrom(
        //       overlayColor: Colors.transparent,
        //     ),
        //   ),
        // ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: Lottie.asset(
                          'assets/lottieFile.json', // Replace with your Lottie animation path
                          height: height * 0.4,
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        'Thank you for shopping',
                        style: TextStyle(
                          fontSize: height * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TrackingDetailScreen()),
                        );
                        // Navigate to the order screen
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFED4226),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ), disabledForegroundColor: Colors.transparent.withOpacity(0.38), disabledBackgroundColor: Colors.transparent.withOpacity(0.12),
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                        elevation: 0, // Remove overlay effect
                      ),
                      child: Text(
                        'View Order',
                        style: TextStyle(
                          fontSize: height * 0.025,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: _showEReceipt,
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.grey, // Text color
                        overlayColor: Colors.transparent, // Remove overlay effect
                      ),
                      child: Text(
                        'View E-Receipt',
                        style: TextStyle(
                          fontSize: height * 0.02,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (_isEReceiptVisible)
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: GestureDetector(
                onTap: _hideEReceipt, // Close e-receipt on outside tap
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: Container(
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: Icon(Icons.close),
                              color: Colors.black,
                              onPressed: _hideEReceipt,
                            ),
                          ),
                          Text(
                            'TID # 12345678985',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Divider(color: Colors.black),
                          Text(
                            'Money Transfer',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(height: 20),
                          _buildReceiptRow('Transferred Amount', 'Rs 4,000.00'),
                          _buildReceiptRow('Fee', 'Rs 00'),
                          _buildReceiptRow('Receiver Name', 'John Doe'),
                          _buildReceiptRow('Account Number', '************'),
                          _buildReceiptRow('Bank', 'Bank of America'),
                          _buildReceiptRow('Transaction Date', '21 Sep 2021'),
                          _buildReceiptRow('Transaction time', '12:05 am'),
                          Divider(color: Colors.black),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  // Share functionality here
                                },     style: TextButton.styleFrom(
                                overlayColor: Colors.transparent,
                              ),
                                child: Text(
                                  'Share',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  _showToast(context); // Show toast message
                                },     style: TextButton.styleFrom(
                                overlayColor: Colors.transparent,
                              ),
                                child: Text(
                                  'Save',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildReceiptRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color: Colors.grey,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
