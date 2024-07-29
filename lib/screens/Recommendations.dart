import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redpro_mart/screens/profileScreen.dart';
import 'package:redpro_mart/screens/searchScreen.dart';
import 'package:redpro_mart/screens/wishlistScreen.dart';

import '../Widgets/bottomNavBar.dart';
import '../Widgets/featuredDealDuplicate.dart';
import 'CartScreen.dart';
import 'HomeScreen.dart';

class Recommendations extends StatefulWidget {
  @override
  State<Recommendations> createState() => _RecommendationsState();
}

class _RecommendationsState extends State<Recommendations> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
    WishlistScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => _widgetOptions[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0.0,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          child: Image.asset(
            'assets/backButton.png',
            height: 30,
            width: 30,
          ),
        ),

        title: Text(
          'Recommendations',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hurry up the deal will end within 14 days',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Assuming 10 products
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: FeaturedDealDuplicate(
                              imagePath: index % 2 == 0
                                  ? 'assets/download.png'
                                  : 'assets/BananaCards.png',
                              title: index % 2 == 0
                                  ? 'Grapes:Yellow Plantai'
                                  : 'Banana: Yellow Plantai',
                              subtitle: index % 2 == 0 ? 'Approx. 40lb' : 'Approx. 1lb',
                              rating: index % 2 == 0 ? 4.5 : 4.2,
                              price: index % 2 == 0 ? 2.99 : 0.99,
                              // Ensure no container with background color
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: FeaturedDealDuplicate(
                              imagePath: index % 2 == 0
                                  ? 'assets/BananaCards.png'
                                  : 'assets/download.png',
                              title: index % 2 == 0
                                  ? 'Banana:Yellow Plantai '
                                  : 'Grapes:Yellow Plantai',
                              subtitle: index % 2 == 0 ? 'Approx. 1lb' : 'Approx. 40lb',
                              rating: index % 2 == 0 ? 4.2 : 4.5,
                              price: index % 2 == 0 ? 0.99 : 2.99,
                              // Ensure no container with background color
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      // Add spacing between rows
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: PersistentBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
