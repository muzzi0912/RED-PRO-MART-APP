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
  String _selectedShippingOption = 'Standard'; // Track selected shipping option

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: GoogleFonts.poppins(fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
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
                  buildShippingOptions(),
                  Divider(height: 38),
                  buildSubtotal(),
                  SizedBox(height: 16),
                  buildSectionTitle('Additional Charges'),
                  SizedBox(height: 8),
                  buildAdditionalCharges(),
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
          SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget buildShippingOptions() {
    return Column(
      children: [
        shippingOption('Standard', 'Delivery in 5-7 business days', 5.99),
        shippingOption('Express', 'Delivery in 2-3 business days', 12.99, isSelected: _selectedShippingOption == 'Express'),
        shippingOption('Next Day', 'Next business day delivery', 24.99),
      ],
    );
  }

  Widget shippingOption(String title, String description, double price, {bool isSelected = false}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Color(0xffe34126) : Colors.grey,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        subtitle: Text(description, style: GoogleFonts.poppins(color: Colors.grey)),
        trailing: Text('\$${price.toStringAsFixed(2)}', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        onTap: () {
          setState(() {
            _selectedShippingOption = title;
          });
        },
      ),
    );
  }

  Widget buildAdditionalCharges() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildChargeDetail('Subtotal', '\$50.00'),
        buildChargeDetail('VAT (5%)', '\$2.50'),
        buildChargeDetail('Shipping Amount', '\$12.99'),
        buildChargeDetail('Total', '\$65.49'),
      ],
    );
  }

  Widget buildChargeDetail(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),
        Text(value, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),
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
}
