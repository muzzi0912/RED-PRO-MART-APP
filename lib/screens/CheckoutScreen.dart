import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redpro_mart/screens/paymentSuccessScreen.dart';
import '../Widgets/buildPaymentMethod.dart';
import '../Widgets/buildProductSetail(shipping).dart';
import '../Widgets/buildSectiontile(checkout).dart';
import '../Widgets/buildShippingAddress.dart';
import '../Widgets/buildShippingOption.dart';
import '../Widgets/buildSubTotal(shipping).dart';
import '../Widgets/buildTotal(shipping).dart';
import 'HomeScreen.dart';

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
      appBar: AppBar(title:Text(
        'Checkout',
        style: GoogleFonts.poppins( fontSize: 24),
      ) ,
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0.0,
        leading:GestureDetector(
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
          SizedBox(height: 5,)
        ],
      ),
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



}
