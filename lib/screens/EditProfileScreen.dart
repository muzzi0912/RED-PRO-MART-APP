import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redpro_mart/Widgets/bottomNavBar.dart';
import 'package:redpro_mart/screens/profileScreen.dart';
import 'package:redpro_mart/screens/searchScreen.dart';
import 'package:redpro_mart/screens/wishlistScreen.dart';

import '../utils/constants.dart';
import 'CartScreen.dart';
import 'HomeScreen.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool _isPasswordObscured = true;
  bool _isNewPasswordObscured = true;
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
    WishlistScreen(),
    ProfileScreen(),
  ];

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordObscured = !_isPasswordObscured;
    });
  }

  void _toggleNewPasswordVisibility() {
    setState(() {
      _isNewPasswordObscured = !_isNewPasswordObscured;
    });
  }
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
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.check,color: Colors.black,))],
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
                  radius: 50,
                  backgroundImage: AssetImage('assets/man.png',),

                ),
                SizedBox(height: 20),
                Column(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Public Information'),
                  ],
                ),
                SizedBox(height: 20),
                TextFormField(
                  enableInteractiveSelection: false,
                  keyboardType: TextInputType.text,
                  cursorColor: Constants.mainAppColor,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.grey),
                    labelText: 'First Name',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    } else if (value.length < 8) {
                      return 'Username must be at least 8 characters';
                    }
                    return null;
                  },
                  onChanged: (value) {
                   // _authController.validateUsername(value);
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  enableInteractiveSelection: false,
                  keyboardType: TextInputType.text,
                  cursorColor: Constants.mainAppColor,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.grey),
                    labelText: 'Last Name',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    } else if (value.length < 8) {
                      return 'Username must be at least 8 characters';
                    }
                    return null;
                  },
                  onChanged: (value) {
                   // _authController.validateUsername(value);
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  enableInteractiveSelection: false,
                  cursorColor: Constants.mainAppColor,
                  obscureText: _isPasswordObscured,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: _togglePasswordVisibility,
                      child: Icon(
                        _isPasswordObscured
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: _isPasswordObscured ? Colors.grey : Constants.mainAppColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  enableInteractiveSelection: false,
                  cursorColor: Constants.mainAppColor,
                  obscureText: _isNewPasswordObscured,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    labelStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: _toggleNewPasswordVisibility,
                      child: Icon(
                        _isNewPasswordObscured
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: _isNewPasswordObscured ? Colors.grey : Constants.mainAppColor,
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 40),
                // ElevatedButton(
                //   onPressed: () {
                //     // Handle next logic
                //   },
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Constants.buttonColor,
                //     padding: EdgeInsets.symmetric(
                //       horizontal: screenWidth * 0.20,
                //       vertical: screenHeight * 0.02,
                //     ),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //   ),
                //   child: Text(
                //     'Update',
                //     style: Constants.poppins(
                //       fontSize: 17,
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ), bottomNavigationBar: PersistentBottomNavBar(
      selectedIndex: _selectedIndex,
      onItemTapped: _onItemTapped,
    ),
    );
  }
}
