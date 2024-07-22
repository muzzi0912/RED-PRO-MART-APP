
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redpro_mart/AuthScreens/ForgetScreen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/cupertino.dart'; // Add this import for Cupertino widgets

import '../utils/constants.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  bool _isEmailValid = false;

  void _validateEmail(String email) {
    setState(() {
      _isEmailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = Constants.screenWidth(context);
    final screenHeight = Constants.screenHeight(context);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Login.png'), // Replace with your background image path
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Constants.screenHeightFraction(context, 0.35)),
                Shimmer.fromColors(
                  baseColor: Colors.black,
                  highlightColor: Colors.white,
                  child: Text(
                    'Login',
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: Constants.screenHeightFraction(context, 0.01)),
                Text(
                  'Good to see you back 🖤️',
                  style: Constants.poppins(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: Constants.screenHeightFraction(context, 0.02)),
                Platform.isIOS ? _buildCupertinoTextField(
                  controller: _emailController,
                  placeholder: 'Email',
                  onChanged: (value) => _validateEmail(value),
                  suffix: _isEmailValid
                      ? Icon(CupertinoIcons.check_mark_circled_solid, color: Colors.green)
                      : null,
                ) : _buildMaterialTextField(
                  controller: _emailController,
                  labelText: 'Email',
                  onChanged: (value) => _validateEmail(value),
                  suffixIcon: _isEmailValid
                      ? Icon(Icons.check_circle, color: Colors.green)
                      : null,
                ),
                SizedBox(height: Constants.screenHeightFraction(context, 0.02)),
                Platform.isIOS ? _buildCupertinoTextField(
                  placeholder: 'Password',
                  obscureText: true,
                  suffix: Icon(CupertinoIcons.eye_solid),
                ) : _buildMaterialTextField(
                  labelText: 'Password',
                  obscureText: true,
                  suffixIcon: Icon(Icons.visibility_off),
                ),
                SizedBox(height: Constants.screenHeightFraction(context, 0.01)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.black,
                      highlightColor: Colors.white,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgetScreen()));
                        },
                        style: TextButton.styleFrom(
                          overlayColor: Colors.transparent,
                        ),
                        child: Text(
                          'Forget Password ?',
                          style: Constants.poppins(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Constants.screenHeightFraction(context, 0.02)),
                Center(
                  child: Column(
                    children: [
                      Platform.isIOS ? _buildCupertinoButton(
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        text: 'Login',
                        onPressed: () {
                          // Handle login logic
                        },
                      ) : _buildMaterialButton(
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        text: 'Login',
                        onPressed: () {
                          // Handle login logic
                        },
                      ),
                      SizedBox(height: Constants.screenHeightFraction(context, 0.01)),
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

  Widget _buildCupertinoTextField({
    TextEditingController? controller,
    String? placeholder,
    bool obscureText = false,
    Widget? suffix,
    ValueChanged<String>? onChanged,
  }) {
    return CupertinoTextField(
      controller: controller,
      placeholder: placeholder,
      obscureText: obscureText,
      onChanged: onChanged,
      padding: EdgeInsets.all(16),
      suffix: suffix,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _buildMaterialTextField({
    TextEditingController? controller,
    String? labelText,
    bool obscureText = false,
    Widget? suffixIcon,
    ValueChanged<String>? onChanged,
  }) {
    return TextField(
      cursorColor: Colors.black,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.black),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText,
    );
  }

  Widget _buildCupertinoButton({
    required double screenWidth,
    required double screenHeight,
    required String text,
    required VoidCallback onPressed,
  }) {
    return CupertinoButton(
      color: Constants.buttonColor,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.30,
        vertical: screenHeight * 0.02,
      ),
      borderRadius: BorderRadius.circular(10),
      onPressed: onPressed,
      child: Text(
        text,
        style: Constants.poppins(
          fontSize: 17,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildMaterialButton({
    required double screenWidth,
    required double screenHeight,
    required String text,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Constants.buttonColor,
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.30,
          vertical: screenHeight * 0.02,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: Constants.poppins(
          fontSize: 17,
          color: Colors.white,
        ),
      ),
    );
  }
}
