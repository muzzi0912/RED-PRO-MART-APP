import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redpro_mart/screens/profileScreen.dart';
import 'package:redpro_mart/screens/searchScreen.dart';
import 'package:redpro_mart/screens/wishlistScreen.dart';

import '../Widgets/bottomNavBar.dart';
import 'CartScreen.dart';
import 'HomeScreen.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Notification', style: GoogleFonts.poppins()),
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0.0,
        centerTitle: true,
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
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildNotificationSection('Today', context),
              buildNotificationItem(
                icon: Icons.local_shipping_outlined,
                title: 'Order Shipped',
                description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                time: '1hr',
                context: context,
              ),
              buildNotificationItem(
                icon: Icons.notifications_outlined,
                title: 'Flash Sale Alert',
                description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                time: '1hr',
                context: context,
              ),
              buildNotificationItem(
                icon: Icons.local_shipping_outlined,
                title: 'Order Shipped',
                description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                time: '1hr',
                context: context,
              ),
              SizedBox(height: screenHeight * 0.02),
              buildNotificationSection('Yesterday', context),
              buildNotificationItem(
                icon: Icons.account_balance_wallet_outlined,
                title: 'New PayPal Added',
                description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                time: '1hr',
                context: context,
              ),
              buildNotificationItem(
                icon: Icons.notifications_outlined,
                title: 'Flash Sale Alert',
                description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                time: '1hr',
                context: context,
              ),
              buildNotificationItem(
                icon: Icons.local_shipping_outlined,
                title: 'Order Shipped',
                description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                time: '1hr',
                context: context,
              ),
              buildNotificationItem(
                icon: Icons.account_balance_wallet_outlined,
                title: 'New PayPal Added',
                description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                time: '1hr',
                context: context,
              ),
              buildNotificationItem(
                icon: Icons.account_balance_wallet_outlined,
                title: 'New PayPal Added',
                description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                time: '1hr',
                context: context,
              ),
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

  Widget buildNotificationSection(String title, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          GestureDetector(
            onTap: () {
              // Implement Mark all as read functionality here
            },
            child: Text(
              'Mark all as read',
              style: GoogleFonts.poppins(fontSize: 14, color: Color(0xffe34126)),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNotificationItem({
    required IconData icon,
    required String title,
    required String description,
    required String time,
    required BuildContext context,
  }) {
    return InkWell(
      onTap: () {
        // Implement tap action here
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.red.shade100,
              child: Icon(icon, color: Color(0xffe34126), size: 30),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      Text(
                        time,
                        style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                  Text(description, style: GoogleFonts.poppins(color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
