import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redpro_mart/screens/ProductDetailScreen.dart';
import 'package:redpro_mart/screens/ShippingScreen.dart';

import '../utils/constants.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<int> _quantities = List<int>.generate(6, (index) => 1);

  void _increaseQuantity(int index) {
    setState(() {
      _quantities[index]++;
    });
  }

  void _decreaseQuantity(int index) {
    if (_quantities[index] > 1) {
      setState(() {
        _quantities[index]--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/backButton.png', // Replace with your back button image path
                      height: 30,
                      width: 40,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'My Cart',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: 6, // Number of items in the cart
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(index.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    // Handle the delete action
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Item deleted')),
                    );
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xFFCDCDCD)),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/apple.png', // Replace with your image asset
                          width: screenWidth * 0.2,
                          height: screenWidth * 0.2,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Fresh, Crisp, and Sweet Gala Apples - Nature\'s Juicy Delight',
                                style: GoogleFonts.poppins(fontSize: 10),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    'USD',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '159.25.00',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepOrange),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.favorite_border,
                                        color: Colors.deepOrange),
                                    onPressed: () {
                                      // Handle favorite icon tap
                                    },
                                  ),
                                  Spacer(),
                                  IconButton(
                                    icon: Icon(Icons.remove_circle_outline,
                                        color: Colors.deepOrange),
                                    onPressed: () {
                                      _decreaseQuantity(index);
                                    },
                                  ),
                                  Text(
                                    '${_quantities[index]}',
                                    style: GoogleFonts.poppins(fontSize: 16),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add_circle_outline,
                                        color: Colors.deepOrange),
                                    onPressed: () {
                                      _increaseQuantity(index);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total',
                      style: GoogleFonts.poppins(
                          fontSize: 18, color: Color(0xFF797979)),
                    ),
                    Text(
                      'USD 2054.00',
                      style: GoogleFonts.poppins(fontSize: 17, color: Colors.black),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ShippingScreen()),
                    );
                    // Handle checkout button tap
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Constants.buttonColor,
                    padding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: 25), // Adjusted padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Checkout',
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
}
