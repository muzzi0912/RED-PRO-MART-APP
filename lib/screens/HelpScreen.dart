import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redpro_mart/screens/profileScreen.dart';
import 'package:redpro_mart/screens/searchScreen.dart';
import 'package:redpro_mart/screens/wishlistScreen.dart';

import '../Widgets/bottomNavBar.dart';
import 'CartScreen.dart';
import 'HomeScreen.dart';
import 'MyOrders.dart';

class HelpCenterScreen extends StatefulWidget {
  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  int _selectedIndex = 0;
  int _expandedIndex = -1; // Track the index of the currently expanded item

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Help Center', style: GoogleFonts.poppins(fontSize: 24)),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyOrdersScreen()),
            );
          },
          child: Image.asset(
            'assets/backButton.png',
            height: 30,
            width: 30,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.bag),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildSearchBar(),
              SizedBox(height: 16),
              buildContactUsSection(),
              SizedBox(height: 16),
              buildContactItem(
                icon: Icons.headset_mic,
                title: 'Customer Service',
                children: [],
                index: 0,
              ),
              SizedBox(height: 10),
              buildContactItem(
                icon: Icons.language,
                title: 'Website',
                children: [],
                index: 1,
              ),
              SizedBox(height: 10),
              buildContactItem(
                icon: Icons.facebook,
                title: 'Facebook',
                children: [],
                index: 2,
              ),
              SizedBox(height: 10),
              buildContactItem(
                icon: Icons.messenger_outline,
                title: 'Twitter',
                children: [],
                index: 3,
              ),
              SizedBox(height: 10),
              buildContactItem(
                icon: Icons.facebook,
                title: 'Instagram',
                children: [
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Text(
                          'https://www.instagram.com/randomuser1234',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
                index: 4,
              ),
              SizedBox(height: 10),
              buildContactItem(
                icon: Icons.help_outline,
                title: 'FAQ\'s',
                children: [],
                index: 5,
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
      bottomNavigationBar: PersistentBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget buildSearchBar() {
    return TextField(
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrange),
        ),
      ),
    );
  }

  Widget buildContactUsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Column(
            children: [
              Text(
                'Contact us',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffe34126)),
              ),
              Container(
                width: 100,
                height: 4,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildContactItem({
    required IconData icon,
    required String title,
    required List<Widget> children,
    required int index,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _expandedIndex = _expandedIndex == index ? -1 : index; // Toggle expansion
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            ListTile(
              leading: Icon(icon, color: Colors.grey),
              title: Text(title),
            ),
            Visibility(
              visible: _expandedIndex == index,
              child: Column(
                children: children,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


