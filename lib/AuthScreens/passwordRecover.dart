import 'package:flutter/material.dart';
import 'package:redpro_mart/AuthScreens/4digitPassScreen.dart';
import 'package:redpro_mart/screens/MainScreen.dart';
import 'package:redpro_mart/AuthScreens/SetupNewPass.dart';
import 'package:shimmer/shimmer.dart';
import '../utils/constants.dart';
import 'loginScreen.dart';

class PasswordRecover extends StatefulWidget {
  @override
  _PasswordRecoverState createState() => _PasswordRecoverState();
}

class _PasswordRecoverState extends State<PasswordRecover> {
  bool isSMSSelected = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = Constants.screenWidth(context);
    double screenHeight = Constants.screenHeight(context);

    return Scaffold(resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
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
                      'Password Recovery',
                      style: Constants.poppins(
                        fontSize: screenHeight * 0.035,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'How would you like to restore your password?',
                    textAlign: TextAlign.center,
                    style: Constants.poppins(
                      fontSize: screenHeight * 0.022,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Column(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.6, // Fixed width for buttons
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isSMSSelected = true;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isSMSSelected
                                ? Constants.buttonColor
                                : Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.015,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'SMS',
                                style: TextStyle(
                                  fontSize: screenHeight * 0.025,
                                  color: isSMSSelected
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              SizedBox(width: 20.0), // Add space between text and check button
                              Container(
                                width: screenHeight * 0.025,
                                height: screenHeight * 0.025,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSMSSelected
                                        ? Colors.white
                                        : Color(0xFF970000), // Maroon color
                                  ),
                                ),
                                child: isSMSSelected
                                    ? Icon(
                                  Icons.check,
                                  size: screenHeight * 0.018,
                                  color: Colors.white,
                                )
                                    : null,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      SizedBox(
                        width: screenWidth * 0.6, // Fixed width for buttons
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isSMSSelected = false;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: !isSMSSelected
                                ? Constants.buttonColor
                                : Colors.white.withOpacity(0.10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.015,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Email',
                                style: TextStyle(
                                  fontSize: screenHeight * 0.025,
                                  color: !isSMSSelected
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              SizedBox(width: 20.0), // Add space between text and check button
                              Container(
                                width: screenHeight * 0.025,
                                height: screenHeight * 0.025,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: !isSMSSelected
                                        ? Colors.white
                                        : Color(0xFF970000), // Maroon color
                                  ),
                                ),
                                child: !isSMSSelected
                                    ? Icon(
                                  Icons.check,
                                  size: screenHeight * 0.018,
                                  color: Colors.white,
                                )
                                    : null,
                              ),
                            ],
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
                            MaterialPageRoute(
                                builder: (context) => SetupNewPassword()),
                          );
                          // Handle login logic
                          // Handle Next action
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Constants.buttonColor,
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.35,
                            vertical: screenHeight * 0.016,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Next',
                          style: Constants.poppins(
                            fontSize: screenHeight * 0.025,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Constants.screenHeightFraction(context, 0.01),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
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
