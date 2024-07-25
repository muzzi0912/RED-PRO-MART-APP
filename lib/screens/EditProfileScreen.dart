import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redpro_mart/screens/profileScreen.dart';

import '../utils/constants.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = Constants.screenWidth(context);
    final screenHeight = Constants.screenHeight(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(),
              ),
            );
          },
          child: Image.asset(
            'assets/backButton.png', // Replace with your back button image path
            height: 30,
            width: 30,
          ),
        ),
        title: Text('Edit Profile'),
        centerTitle: true,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
             // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50, // Adjust radius as needed
                  backgroundColor: Colors.grey[200], // Background color if no image
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: GoogleFonts.poppins(color: Colors.grey), // Default label color
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Constants.mainAppColor), // Focused border color
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: GoogleFonts.poppins(color: Colors.grey), // Default label color
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Constants.mainAppColor), // Focused border color
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: 'Mobile number',
                    labelStyle: GoogleFonts.poppins(color: Colors.grey), // Default label color
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Constants.mainAppColor), // Focused border color
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    labelStyle: GoogleFonts.poppins(color: Colors.grey), // Default label color
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Constants.mainAppColor), // Focused border color
                    ),
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    // Handle next logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Constants.buttonColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.20,
                      vertical: screenHeight * 0.02,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Update',
                    style: Constants.poppins(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
