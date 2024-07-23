
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redpro_mart/screens/TrackingDetailScreen.dart';

import 'MyOrders.dart';


class OrderHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {    final screenWidth = MediaQuery.of(context).size.width;

  return Scaffold(backgroundColor:Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title:  Text(
          "Order History",
          style: GoogleFonts.poppins(fontSize: screenWidth * 0.06),
        ),centerTitle: true,
        scrolledUnderElevation: 0.0,
        leading:GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TrackingDetailScreen()),
            );
          },
          child: Image.asset(
            'assets/backButton.png', // Replace with your back button image path
            height: 30,
            width: 40,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.grey)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/banana.png',
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Order #25125',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.pink[100],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          child: Text(
                            'In Progress',
                            style: TextStyle(color: Color(0xffe34126)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 140,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Item',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Perfectly Ripe Bananas',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 140,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text('Courier',
                                        style: TextStyle(color: Colors.grey)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('UPS, R, Gosling',
                                        style: TextStyle(fontSize: 12)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 140,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Start Time',
                                      style: TextStyle(color: Colors.grey, fontSize: 12),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '14-Jan-2023',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 140,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text('Address',
                                        style: TextStyle(color: Colors.grey, fontSize: 12)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text('Street no# 43 washington...',
                                          style: TextStyle(fontSize: 14)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffe34126),
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text('Export Details',
                            style: TextStyle(color: Colors.white)),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          overlayColor: Color(0xffe34126),
                          side: BorderSide(color: Colors.red),
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text('Request Confirmation',
                            style: TextStyle(color: Color(0xffe34126))),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child: DefaultTabController(
                      length: 4,
                      child: Column(
                        children: [
                          TabBar(
                            labelColor: Color(0xffe34126),
                            unselectedLabelColor: Colors.grey,
                            indicatorColor: Color(0xffe34126),
                            tabs: [
                              Tab(text: 'Order'),
                              Tab(text: 'Details'),
                              Tab(text: 'Courier'),
                              Tab(text: 'Receiver'),
                            ],
                          ),
                          Container(
                            height: 320, // Adjust height as needed
                            child: TabBarView(
                              children: [
                                buildTrackingTimeline(), // Replace with your actual content for each tab
                                Center(child: Text('Item details')),
                                Center(child: Text('Courier')),
                                Center(child: Text('Receiver')),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )

                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order 1 of 3', style: TextStyle(color: Colors.grey)),
            TextButton(
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyOrdersScreen()), // Replace NextScreen() with your target screen
             );
              },
              child: Text(
                'Next Order →',
                style: TextStyle(color: Color(0xffe34126)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTrackingTimeline() {
    return Column(
      children: [
        buildTimelineStep(
          isActive: true,
          isCompleted: true,
          title: 'Product Shipped',
          date: '14-Jan-2023',
          time: '',
          description: '',
        ),
        buildTimelineStep(
          isActive: true,
          isCompleted: true,
          title: 'Product Packaging',
          date: '14-Jan-2023',
          time: '',
          description:
          'Tracking number: 68415446461546\nWarehouse: Washington, United States',
        ),
        buildTimelineStep(
          isActive: true,
          isCompleted: false,
          title: 'Order Confirmed',
          date: '14-Jan-2023',
          time: '15:54 am',
          description: '',
        ),
        buildTimelineStep(
          isActive: false,
          isCompleted: false,
          title: 'Order Placed',
          date: '14-Jan-2023',
          time: '15:54 am',
          description: '',
        ),
      ],
    );
  }

  Widget buildTimelineStep({
    required bool isActive,
    required bool isCompleted,
    required String title,
    required String date,
    required String time,
    required String description,
  }) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: Color(0xffe3c2c2),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: isCompleted ? Color(0xffe34126) : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Container(
              height: isActive ? 50 : 0,
              width: 2,
              color: isActive ? Color(0xffe34126) : Colors.grey,
            ),
          ],
        ),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(date),
              if (time.isNotEmpty) Text(time),
              if (description.isNotEmpty) Text(description),
            ],
          ),
        ),
        if (description.isNotEmpty)
          TextButton(
            onPressed: () {},
            child:
            Text('See Details', style: TextStyle(color: Color(0xffe34126))),
          ),
      ],
    );
  }
}
