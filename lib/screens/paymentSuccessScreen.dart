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

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
          style: TextButton.styleFrom(
            overlayColor: Colors.transparent,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.bag),
            onPressed: () {},
            style: TextButton.styleFrom(
              overlayColor: Colors.transparent,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Positioned(
                            left: 0,
                            child: Container(
                              width: 60, // Set the width for the back button
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ShippingScreen()),
                                  );
                                },
                                child: Image.asset(
                                  'assets/backButton.png', // Replace with your back button image path
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              'Payment',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
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
                        ),
                        padding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 100),
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
                      child: Text(
                        'View E-Receipt',
                        style: TextStyle(
                          fontSize: height * 0.02,
                          color: Colors.grey,
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
                              },
                              child: Text(
                                'Share',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                // Save functionality here
                              },
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
