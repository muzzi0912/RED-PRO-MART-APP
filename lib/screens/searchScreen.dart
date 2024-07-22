import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redpro_mart/screens/profileScreen.dart';
import 'package:redpro_mart/screens/wishlistScreen.dart';

import '../Widgets/ProductCardWidget.dart';
import '../Widgets/bottomNavBar.dart';
import '../utils/constants.dart';
import 'CartScreen.dart';
import 'HomeScreen.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final isTablet = screenWidth >= 600 && screenWidth < 900;
    final isDesktop = screenWidth >= 900;

    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0.0,
        leading: IconButton(
          onPressed: () {},   style: TextButton.styleFrom(
          overlayColor: Colors.transparent,
        ),
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.bag),
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
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Search',
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,

                  ),
                ),
                SizedBox(width: 8.0,),
                Expanded(
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 13.0),
                      // Adjusted content padding for height
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Constants.mainAppColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),

                )
              ],
            ),
            SizedBox(height: 16.0),
            _buildSectionTitle(
              'Search history',
              action: IconButton(onPressed:(){}, icon: Icon(CupertinoIcons.delete,color: Colors.red,)
              // action: GestureDetector(
              //   onTap: () {
              //
              //     // Add your delete action here
              //   },
                // child: Stack(
                //   children: [
                //     Image.asset(
                //       'assets/Ellipse.png', // Replace with your image path
                //       height: 26, // Adjust height as needed
                //       width: 26, // Adjust width as needed
                //     ),
                //     Positioned(
                //       top: 4, // Adjust position as needed
                //       left: 4, // Adjust position as needed
                //       child: Image.asset(
                //         'assets/Delete.png',
                //         // Replace with your icon image path
                //         height: 16, // Adjust height as needed
                //         width: 16, // Adjust width as needed
                //       ),
                //     ),
                //   ],
                // ),
              ),
            ),
            SizedBox(height: 30,),


            _buildChips(['Apples', 'Banana', 'Papaya', 'Avocado', 'Mango','Melon']),
            SizedBox(height: 25.0),
            _buildSectionTitle('Recommendations'),
            SizedBox(height: 25,),
            _buildChips(['Apples', 'Apricot', 'Cherry', 'Orange', 'Grapes','Leche']),
            SizedBox(height: 25.0),
            _buildSectionTitle('Discover'),
            SizedBox(height: 25.0),
            _buildDiscoverSection(isTablet, isDesktop),
          ],
        ),
      ),
      bottomNavigationBar: PersistentBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget _buildSectionTitle(String title, {Widget? action}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF464646)
          ),
        ),
        if (action != null) action,
      ],
    );
  }


  Widget _buildChips(List<String> labels) {
    return Wrap(
      spacing: 12.0,
      runSpacing: 8.0,
      children: labels.map((label) {
        return Chip(
          labelPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
          label: Text(
            label,
            style: GoogleFonts.poppins(fontSize: 14),
          ),
          backgroundColor: Colors.grey[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
            // Adjust border radius as needed
            side: BorderSide(color: Colors.transparent), // Remove border
          ),
          materialTapTargetSize: MaterialTapTargetSize
              .shrinkWrap, // Remove padding around the chip
        );
      }).toList(),
    );
  }


  Widget _buildDiscoverSection(bool isTablet, bool isDesktop) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildProductCard(
            imagePath: 'assets/ApplesBanner.png',
            title: 'Red Gala Apples',
            price: '\$12.00',
            description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
          ),
          SizedBox(width: 16.0),
          _buildProductCard(
            imagePath: 'assets/appleBasket.png',
            title: 'Apples',
            price: '\$12.00',
            description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
          ),
          SizedBox(width: 16.0),
          _buildProductCard(
            imagePath: 'assets/BananaCards.png',
            title: 'Banana',
            price: '\$12.00',
            description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard({
    required String imagePath,
    required String title,
    required String price,
    required String description,
  }) {
    return Container(
      width: 300.0,
      child: ProductCard(
        imagePath: imagePath,
        title: title,
        subtitle: description,
        rating: 4.5,
        // Example rating value, adjust as per your needs
        price: double.parse(price.replaceAll('\$', '').replaceAll(
            ',', '')), // Example price parsing, adjust as per your needs
      ),
    );
  }
}


