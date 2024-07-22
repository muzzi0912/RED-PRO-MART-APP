import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:redpro_mart/AuthScreens/loginScreen.dart';
import 'package:shimmer/shimmer.dart'; // Import shimmer package
import '../utils/constants.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _requestPermission() {
    // Implement permission request logic here
    print('Requesting permission...');
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = Constants.screenWidth(context);
    final screenHeight = Constants.screenHeight(context);

    return Container(
      height: screenHeight, // Adjust height as needed
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Signup.png'), // Replace with your background image path
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Constants.screenHeightFraction(context, 0.12)),
                Shimmer.fromColors(
                  baseColor: Colors.black,
                  highlightColor: Colors.white,
                  child: Text(
                    'Create',
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.black,
                  highlightColor: Colors.white,
                  child: Text(
                    'Account',
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: Constants.screenHeightFraction(context, 0.03)),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          // Handle camera icon tap
                        },
                        child: Container(
                          width: screenWidth * 0.2,
                          height: screenWidth * 0.2,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Constants.mainAppColor,
                              width: 2.0,
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: Constants.buttonColor,
                              size: screenWidth * 0.1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 204,
                      child: GestureDetector(
                        onTap: _requestPermission,
                        child: Container(
                          width: screenWidth * 0.1,
                          height: screenWidth * 0.1,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add_circle_outline,
                              color: Constants.buttonColor,
                              size: screenWidth * 0.05,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Constants.screenHeightFraction(context, 0.04)),
                TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    labelText: 'Username',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: Constants.screenHeightFraction(context, 0.02)),
                TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    labelText: 'Email',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: Constants.screenHeightFraction(context, 0.02)),
                TextField(
                  cursorColor: Colors.black,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    labelText: 'Password',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: _togglePasswordVisibility,
                      child: Icon(
                        _obscurePassword ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Constants.screenHeightFraction(context, 0.02)),
                IntlPhoneField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    labelText: 'Your number',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  initialCountryCode: 'US', // Initial country code
                  onChanged: (phone) {
                    print(phone.completeNumber); // Outputs the complete number with country code
                  },
                  dropdownDecoration: BoxDecoration(
                    color: Colors.grey[200],
                  ),
                  dropdownIcon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.orange,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.black,
                      highlightColor: Colors.white,
                      child: TextButton(
                        onPressed: () {
                          // Handle navigation to login
                        },
                        style: TextButton.styleFrom(
                          overlayColor: Colors.transparent,
                        ),
                        child: Text(
                          'Already have an account?',
                          style: Constants.poppins(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Constants.screenHeightFraction(context, 0.01)),
                Center(
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                          );
                          // Handle signup logic
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Constants.buttonColor,
                          padding: EdgeInsets.symmetric(
                            horizontal: Constants.screenWidthFraction(context, 0.30),
                            vertical: Constants.screenHeightFraction(context, 0.02),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Signup',
                          style: Constants.poppins(
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: Constants.screenHeightFraction(context, 0.01)),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginScreen()));
                          // Handle cancel logic
                        },
                        style: TextButton.styleFrom(
                          overlayColor: Colors.transparent,
                        ),
                        child: Text(
                          'Cancel',
                          style: Constants.poppins(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
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
