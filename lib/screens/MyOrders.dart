
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redpro_mart/screens/OrderHistory.dart';
import 'package:redpro_mart/screens/TrackingDetailScreen.dart';
import 'package:redpro_mart/screens/profileScreen.dart';
import 'package:redpro_mart/screens/searchScreen.dart';
import 'package:redpro_mart/screens/wishlistScreen.dart';

import '../Widgets/bottomNavBar.dart';
import 'CartScreen.dart';
import 'HomeScreen.dart';
import 'NotificationScreen.dart';
import 'leaveReviewScreen.dart';

class MyOrdersScreen extends StatefulWidget {
  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.white,
title: Text(
  'My Orders',

  style: GoogleFonts.poppins(fontSize: 24),
),centerTitle: true,
          surfaceTintColor: Colors.white,
          scrolledUnderElevation: 0.0,
          leading: GestureDetector(onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OrderHistoryScreen()),
            );
          },
            child: Image.asset(
              'assets/backButton.png', // Replace with your back button image path
              height: 30,
              width: 30,
            ),
          ),

          bottom: TabBar(
            labelColor: Color(0xffe34126),
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color(0xffe34126),
            tabs: [
              Tab(text: 'Active'),
              Tab(text: 'Completed'),
              Tab(text: 'Canceled'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildOrderList(),
            buildOrderList1(),
            buildOrderList2(),
          ],
        ),
        bottomNavigationBar: PersistentBottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }

  Widget buildOrderList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 15,
      itemBuilder: (context, index) {
        return buildOrderItem();
      },
    );
  }

  Widget buildOrderItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/ApplesBanner.png',
                height: 70,
                width: 70,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Red Gala Apple',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text('Qty: 4kg | Grade: US',
                    style: TextStyle(color: Colors.grey)),
                SizedBox(height: 4),
                Text('\$52.00',
                    style: TextStyle(color: Color(0xffe34126), fontSize: 16)),
              ],
            ),
          ),
          SizedBox(width: 16),
          ElevatedButton(
            onPressed: () { Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TrackingDetailScreen()));},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xffe34126),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text('Track Order',
                style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
        ],
      ),
    );
  }

  Widget buildOrderList1() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 15,
      itemBuilder: (context, index) {
        return buildOrderItem1();
      },
    );
  }

  Widget buildOrderItem1() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/ApplesBanner.png',
                height: 70,
                width: 70,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [   SizedBox(height: 12),
                Text(
                  'Red Gala Apple',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text('Qty: 4kg | Grade: US',
                    style: TextStyle(color: Colors.grey)),
                SizedBox(height: 4),
                Text('\$52.00',
                    style: TextStyle(color: Color(0xffe34126), fontSize: 16)),
              ],
            ),
          ),
          SizedBox(width: 13),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LeaveReviewScreen()));
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(80, 10),
              backgroundColor: Color(0xffe34126),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text('Leave Review',
                style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
        ],
      ),
    );
  }

  Widget buildOrderList2() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 15,
      itemBuilder: (context, index) {
        return buildOrderItem2();
      },
    );
  }

  Widget buildOrderItem2() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/ApplesBanner.png',
                height: 70,
                width: 70,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Red Gala Apple',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text('Qty: 4kg | Grade: US',
                    style: TextStyle(color: Colors.grey)),
                SizedBox(height: 4),
                Text('\$52.00',
                    style: TextStyle(color: Color(0xffe34126), fontSize: 16)),
              ],
            ),
          ),
          SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: Size(80, 10),
              backgroundColor: Color(0xffe34126),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text('Re-Order',
                style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
