import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:redpro_mart/AuthScreens/SetupNewPass.dart';
import 'package:redpro_mart/AuthScreens/passwordRecover.dart';
import 'package:shimmer/shimmer.dart'; // Import shimmer package
import '../utils/constants.dart';
import 'loginScreen.dart';

class ForgetScreen extends StatefulWidget {
  @override
  _ForgetScreenState createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  final _emailController = TextEditingController();
  bool _isEmailValid = false;

  void _validateEmail(String email) {
    setState(() {
      _isEmailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
    });
  }

  void _dismissKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = Constants.screenWidth(context);
    final screenHeight = Constants.screenHeight(context);

    return GestureDetector(
      onTap: _dismissKeyboard,
      child: Container(
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
                  SizedBox(height: Constants.screenHeightFraction(context, 0.37)),
                  Shimmer.fromColors(
                    baseColor: Colors.black,
                    highlightColor: Colors.white,
                    child: Text(
                      'Forgot Password',
                      style: Constants.poppins(
                        fontSize: screenWidth * 0.08,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: Constants.screenHeightFraction(context, 0.01)),
                  Text(
                    'Recover your password',
                    style: Constants.poppins(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Constants.screenHeightFraction(context, 0.03)),
                  TextField(
                    enableInteractiveSelection: false,
                    cursorColor: Constants.mainAppColor,
                    controller: _emailController,
                    onChanged: (value) => _validateEmail(value),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: _isEmailValid
                          ? Icon(Icons.check, color: Colors.green)
                          : null,
                    ),
                  ),
                  SizedBox(height: Constants.screenHeightFraction(context, 0.03)),
                  Center(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PasswordRecover()),
                            );
                            // Handle next logic
                          },
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
                            'Next',
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
                              MaterialPageRoute(builder: (context) => LoginScreen()),
                            );
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
      ),
    );
  }
}
