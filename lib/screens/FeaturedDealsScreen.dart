import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redpro_mart/screens/profileScreen.dart';
import 'package:redpro_mart/screens/searchScreen.dart';
import 'package:redpro_mart/screens/wishlistScreen.dart';

import '../Widgets/bottomNavBar.dart';
import '../Widgets/featuredDealDuplicate.dart';
import 'CartScreen.dart';
import 'HomeScreen.dart';

class FeaturedDealsScreen extends StatefulWidget {
  @override
  State<FeaturedDealsScreen> createState() => _FeaturedDealsScreenState();
}

class _FeaturedDealsScreenState extends State<FeaturedDealsScreen> {
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
      // Set the AppBar background color to white
        elevation: 0,
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
            icon: Icon(CupertinoIcons.bag,color: Colors.black,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },   style: TextButton.styleFrom(
            overlayColor: Colors.transparent,
          ),
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Featured Deals',
              style: TextStyle(color: Colors.black), // Set the AppBar text color to black
            ),
            Image.asset(
              'assets/fire.png', // Replace with your icon image path
              height: 20, // Adjust height as needed
              width: 20, // Adjust width as needed
            ),
          ],
        ),
        centerTitle: true, // Center the title
        iconTheme: IconThemeData(color: Colors.black), // Set the icon color to black
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10,left: 10),
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
                                  ? 'assets/grapes12.png'
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
                                  : 'assets/grapes12.png',
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
                     const SizedBox(height: 30),
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
