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
  int _selectedIndex = 1;
  Set<String> _selectedItems = {};
  String _searchText = '';
  Set<int> _wishlistSelectedItems = {};

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

  void _onChipSelected(String label) {
    setState(() {
      if (_selectedItems.contains(label)) {
        _selectedItems.remove(label);
        _searchText = _searchText.replaceFirst(label, '').trim();
      } else {
        _selectedItems.add(label);
        _searchText += ' $label';
      }
    });
  }

  void _onWishlistItemTapped(int index) {
    setState(() {
      if (_wishlistSelectedItems.contains(index)) {
        _wishlistSelectedItems.remove(index);
      } else {
        _wishlistSelectedItems.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600 && screenWidth < 900;
    final isDesktop = screenWidth >= 900;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
                SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    cursorColor: Colors.black,
                    controller: TextEditingController(text: _searchText),
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 13.0),
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
                ),
              ],
            ),
            SizedBox(height: 16.0),
            _buildSectionTitle(
              'Search history',
              action: IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.delete, color: Colors.red),
              ),
            ),
            SizedBox(height: 30),
            _buildChips(['Apples', 'Banana', 'Papaya', 'Avocado', 'Mango', 'Melon']),
            SizedBox(height: 25.0),
            _buildSectionTitle('Recommendations'),
            SizedBox(height: 25),
            _buildChips(['Apples', 'Apricot', 'Cherry', 'Orange', 'Grapes', 'Leche']),
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
            color: Color(0xFF464646),
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
        final isSelected = _selectedItems.contains(label);
        return GestureDetector(
          onTap: () => _onChipSelected(label),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
            decoration: BoxDecoration(
              color: isSelected ? Colors.orange[100] : Colors.grey[100],
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Colors.transparent),
            ),
            child: Text(
              label,
              style: GoogleFonts.poppins(fontSize: 14),
            ),
          ),
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
            index: 0,
          ),
          SizedBox(width: 16.0),
          _buildProductCard(
            imagePath: 'assets/appleBasket.png',
            title: 'Apples',
            price: '\$12.00',
            description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            index: 1,
          ),
          SizedBox(width: 16.0),
          _buildProductCard(
            imagePath: 'assets/BananaCards.png',
            title: 'Banana',
            price: '\$12.00',
            description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            index: 2,
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
    required int index,
  }) {
    final isWishlistSelected = _wishlistSelectedItems.contains(index);

    return GestureDetector(
      onTap: () => _onWishlistItemTapped(index),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 300.0,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: isWishlistSelected ? Colors.orange[100] : Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ProductCard(
          imagePath: imagePath,
          title: title,
          subtitle: description,
          rating: 4.5,
          price: double.parse(price.replaceAll('\$', '').replaceAll(',', '')),
        ),
      ),
    );
  }
}
