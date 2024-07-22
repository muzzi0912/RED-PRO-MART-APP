import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redpro_mart/screens/MyOrders.dart';

import 'HomeScreen.dart';

class LeaveReviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0.0,

        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
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
              Row(
                children: [
                  GestureDetector(
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
                  SizedBox(width: 80),
                  Center(
                    child: Text(
                      'Leave Review',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
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

  Widget buildProductDetails(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/banana.png',
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.height * 0.1,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.04),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fresh and Juicy Papaya',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Row(
                children: [
                  Icon(Icons.star,
                      color: Colors.orange,
                      size: MediaQuery.of(context).size.width * 0.04),
                  Icon(Icons.star,
                      color: Colors.orange,
                      size: MediaQuery.of(context).size.width * 0.04),
                  Icon(Icons.star,
                      color: Colors.orange,
                      size: MediaQuery.of(context).size.width * 0.04),
                  Icon(Icons.star,
                      color: Colors.orange,
                      size: MediaQuery.of(context).size.width * 0.04),
                  Icon(Icons.star_border,
                      color: Colors.orange,
                      size: MediaQuery.of(context).size.width * 0.04),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                  Text(
                    '(04)',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: MediaQuery.of(context).size.width * 0.03,
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Text(
                '\$40.00',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Color(0xffe34126),
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xffe34126),
            padding: EdgeInsets.symmetric(vertical: 9, horizontal: 19),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text('Re-Order', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
    );
  }

  Widget buildRatingSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Your Overall Rating',
          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star,
                color: Colors.orange,
                size: MediaQuery.of(context).size.width * 0.09),
            Icon(Icons.star,
                color: Colors.orange,
                size: MediaQuery.of(context).size.width * 0.09),
            Icon(Icons.star,
                color: Colors.orange,
                size: MediaQuery.of(context).size.width * 0.09),
            Icon(Icons.star,
                color: Colors.orange,
                size: MediaQuery.of(context).size.width * 0.09),
            Icon(Icons.star_border,
                color: Colors.orange,
                size: MediaQuery.of(context).size.width * 0.09),
          ],
        ),
      ],
    );
  }

  Widget buildReviewSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Add Detail Review',
          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.03),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        TextField(
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'Enter here',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
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
