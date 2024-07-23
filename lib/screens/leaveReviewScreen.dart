import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redpro_mart/screens/MyOrders.dart';

import '../Widgets/buildProdcutDetail(ReviewScreen).dart';
import '../Widgets/buildReviewSection.dart';
import '../Widgets/ratingSection(review).dart';
import 'HomeScreen.dart';

class LeaveReviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title:  Text(
        'Leave Review',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0.0,

        elevation: 0.0,
        leading:GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyOrdersScreen()),
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
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 30),
              buildProductDetails(context),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Divider(),
              Center(child: buildSectionTitle('How is your Order?')),
              Divider(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              buildRatingSection(context),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              buildReviewSection(context),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              buildAddPhotoSection(context),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Cancel', style: TextStyle(color: Colors.black)),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffe34126),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Submit', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
    );
  }

  Widget buildAddPhotoSection(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.camera_alt_outlined, color: Color(0xffe34126)),
        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        Text('add photo', style: TextStyle(color: Color(0xffe34126))),
      ],
    );
  }
}
