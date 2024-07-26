import 'package:flutter/material.dart';
import 'package:redpro_mart/AuthScreens/passwordRecover.dart';
import 'package:shimmer/shimmer.dart';
import '../utils/constants.dart';
import '4digitPassScreen.dart';
import 'loginScreen.dart';

class SetupNewPassword extends StatefulWidget {
  @override
  _SetupNewPasswordState createState() => _SetupNewPasswordState();
}

class _SetupNewPasswordState extends State<SetupNewPassword> {
  bool _isPasswordObscured = true;
  bool _isNewPasswordObscured = true;

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

  @override
  Widget build(BuildContext context) {
    double screenWidth = Constants.screenWidth(context);
    double screenHeight = Constants.screenHeight(context);

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/passwordRecovery.png', // Replace with your background image path
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: screenHeight * 0.03),
                  Shimmer.fromColors(
                    baseColor: Colors.black,
                    highlightColor: Colors.white,
                    child: Text(
                      'Setup New Password',
                      style: Constants.poppins(
                        fontSize: screenHeight * 0.035,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Center(
                    child: Text(
                      'Please setup a new password for your account',
                      textAlign: TextAlign.center,
                      style: Constants.poppins(
                        fontSize: screenHeight * 0.022,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Column(
                    children: [
                      Container(
                        width: screenWidth * 0.8,
                        child: TextField(
                          enableInteractiveSelection: false,
                          cursorColor: Constants.mainAppColor,
                          obscureText: _isPasswordObscured,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.black),
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
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Container(
                        width: screenWidth * 0.8,
                        child: TextField(
                          enableInteractiveSelection: false,
                          cursorColor: Constants.mainAppColor,
                          obscureText: _isNewPasswordObscured,
                          decoration: InputDecoration(
                            labelText: 'New Password',
                            labelStyle: TextStyle(color: Colors.black),
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
                                color: _isPasswordObscured ? Colors.grey : Constants.mainAppColor
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EnterCodePass()));
                          // Handle Save action
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Constants.buttonColor,
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.3,
                            vertical: screenHeight * 0.017,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Save',
                          style: Constants.poppins(
                            fontSize: screenHeight * 0.025,
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
                          overlayColor: Colors.orange,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
