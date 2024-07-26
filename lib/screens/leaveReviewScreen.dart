import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redpro_mart/screens/MyOrders.dart';
import 'package:image_picker/image_picker.dart'; // Import the image picker package

import '../Widgets/buildProdcutDetail(ReviewScreen).dart';
import '../Widgets/buildReviewSection.dart';
import '../Widgets/ratingSection(review).dart'; // Ensure this import matches the location of your new RatingSection widget
import 'HomeScreen.dart';

class LeaveReviewScreen extends StatefulWidget {
  @override
  _LeaveReviewScreenState createState() => _LeaveReviewScreenState();
}

class _LeaveReviewScreenState extends State<LeaveReviewScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Leave Review',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0.0,
        elevation: 0.0,
        leading: GestureDetector(
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
              RatingSection(), // Updated to use the new RatingSection widget
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              buildReviewSection(context),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              buildAddPhotoSection(context),
              //SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                  padding: EdgeInsets.symmetric(vertical: 9, horizontal: 40), // Adjust padding for button size
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
                  padding: EdgeInsets.symmetric(vertical: 9, horizontal: 40), // Adjust padding for button size
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
    return Container(
      color: Colors.white, // Set the container color to white
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.camera_alt_outlined, color: Color(0xffe34126)),
            onPressed: _pickImage, // Call _pickImage method when pressed
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.00),
          TextButton(
            onPressed: _pickImage,
            child: Text(
              'Add photo',
              style: TextStyle(color: Color(0xffe34126)),
            ),
          ),
        ],
      ),
    );
  }
}
