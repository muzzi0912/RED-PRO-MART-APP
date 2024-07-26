import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redpro_mart/screens/profileScreen.dart';
import 'package:redpro_mart/screens/searchScreen.dart';
import 'package:redpro_mart/screens/wishlistScreen.dart';
import '../Widgets/bottomNavBar.dart';
import '../Widgets/filterDialogue.dart';
import '../utils/constants.dart';
import '../Widgets/ProductCardDuplicate.dart';
import 'CartScreen.dart';
import 'HomeScreen.dart';

class ProductListingScreen extends StatefulWidget {
  @override
  State<ProductListingScreen> createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
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

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return FilterDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0.0,
        leading:
        Icon(Icons.menu,color: Colors.white,),


          ),



      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
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
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: 'Search products...',
                      suffixIcon: Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.deepOrange),
                      ),
                      fillColor: Colors.grey.shade200,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Trending Products',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.filter_alt_outlined,
                    color: Constants.mainAppColor,
                    size: 30,
                  ),
                  onPressed: _showFilterDialog, // Show filter dialog
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              '25 products found',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: ProductCardDuplicate(
                              imagePath: index % 2 == 0
                                  ? 'assets/grapes12.png'
                                  : 'assets/BananaCards.png',
                              title: index % 2 == 0 ? 'Grapes: Yellow Plantain' : 'Bananas: Yellow Plantain',
                              subtitle: index % 2 == 0 ? 'Approx. 40lb' : 'Approx. 1lb',
                              rating: index % 2 == 0 ? 4.5 : 4.2,
                              price: index % 2 == 0 ? 2.99 : 0.99,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: ProductCardDuplicate(
                              imagePath: index % 2 == 0
                                  ? 'assets/BananaCards.png'
                                  : 'assets/grapes12.png',
                              title: index % 2 == 0 ? 'Bananas: Yellow Plantain' : 'Grapes: Yellow Plantain',
                              subtitle: index % 2 == 0 ? 'Approx. 1lb' : 'Approx. 40lb',
                              rating: index % 2 == 0 ? 4.2 : 4.5,
                              price: index % 2 == 0 ? 0.99 : 2.99,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
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

