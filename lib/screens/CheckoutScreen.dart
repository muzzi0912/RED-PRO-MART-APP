import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redpro_mart/screens/paymentSuccessScreen.dart';
import '../Widgets/buildSectiontile(checkout).dart';
import '../Widgets/buildShippingAddress.dart';
import '../utils/constants.dart';
import 'HomeScreen.dart';
import 'TrackingDetailScreen.dart';
import 'ShippingScreen.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int _selectedPaymentIndex = 0; // Track selected payment method index

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          SizedBox(height: 20),
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
                            builder: (context) => HomeScreen()),
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
                  'Checkout',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSectionTitle('Shipping Address'),
                  buildShippingAddress(),
                  Divider(height: 32),
                  buildProductDetails(),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildSectionTitle('Select Shipping'),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'See all options',
                            style: GoogleFonts.poppins(color: Color(0xffe34126)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  buildShippingOption(),
                  Divider(height: 38),
                  buildSubtotal(),
                  SizedBox(height: 16),
                  buildSectionTitle('Payment Method'),
                  buildPaymentMethods(),
                  Divider(height: 60),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildTotal(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentSuccessfulScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffe34126),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Place Order',
                    style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }





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

  Widget buildPaymentMethods() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          buildPaymentMethod(
            icon: Icons.money,
            title: 'Cash',
            description: 'Lorem Ipsum is simply dummy text of the printing.',
            isSelected: _selectedPaymentIndex == 0,
            onTap: () {
              setState(() {
                _selectedPaymentIndex = 0;
              });
            },
          ),
          buildPaymentMethod(
            icon: Icons.account_balance,
            title: 'Bank Transfer',
            description: 'Lorem Ipsum is simply dummy text of the printing.',
            isSelected: _selectedPaymentIndex == 1,
            onTap: () {
              setState(() {
                _selectedPaymentIndex = 1;
              });
            },
          ),
          buildPaymentMethod(
            icon: Icons.payment,
            title: 'Paypal',
            description: 'Lorem Ipsum is simply dummy text of the printing.',
            isSelected: _selectedPaymentIndex == 2,
            onTap: () {
              setState(() {
                _selectedPaymentIndex = 2;
              });
            },
          ),
        ],
      ),
    );
  }

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
}
