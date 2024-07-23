import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redpro_mart/AuthScreens/ForgetScreen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/cupertino.dart'; // Add this import for Cupertino widgets
import '../utils/constants.dart';
import 'SignupScreen.dart'; // Import the CreateAccountScreen for navigation

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Key for form validation
  bool _isEmailValid = false;
  bool _obscurePassword = true;

  void _validateEmail(String email) {
    setState(() {
      _isEmailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
      ).hasMatch(email);
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Handle login logic here
      // For example: Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      // Show an error message if validation fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid email address')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = Constants.screenWidth(context);
    final screenHeight = Constants.screenHeight(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: screenHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Login.png'), // Replace with your background image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey, // Form key for validation
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
                    Platform.isIOS
                        ? _buildCupertinoTextField(
                      controller: _emailController,
                      placeholder: 'Email',
                      onChanged: (value) => _validateEmail(value),
                      suffix: _isEmailValid
                          ? Icon(CupertinoIcons.check_mark_circled_solid, color: Colors.green)
                          : null,
                      validator: (value) {
                        if (value == null || value.isEmpty || !_isEmailValid) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    )
                        : _buildMaterialTextField(
                      controller: _emailController,
                      labelText: 'Email',
                      onChanged: (value) => _validateEmail(value),
                      suffixIcon: _isEmailValid
                          ? Icon(Icons.check_circle, color: Colors.green)
                          : null,
                      validator: (value) {
                        if (value == null || value.isEmpty || !_isEmailValid) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: Constants.screenHeightFraction(context, 0.02)),
                    Platform.isIOS
                        ? _buildCupertinoTextField(
                      controller: _passwordController,
                      placeholder: 'Password',
                      obscureText: _obscurePassword,
                      onChanged: (value) {
                        // Handle password change if needed
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        } else if (value.length < 8) {
                          return 'Password do not match';
                        }
                        return null;
                      },
                      suffix: GestureDetector(
                        onTap: _togglePasswordVisibility,
                        child: Icon(
                          _obscurePassword ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                          color: _obscurePassword ? Colors.grey : Colors.orange,
                        ),
                      ),
                    )
                        : _buildMaterialTextField(
                      controller: _passwordController,
                      labelText: 'Password',
                      obscureText: _obscurePassword,
                      onChanged: (value) {
                        // Handle password change if needed
                      },
                      suffixIcon: GestureDetector(
                        onTap: _togglePasswordVisibility,
                        child: Icon(
                          _obscurePassword ? Icons.visibility : Icons.visibility_off,
                          color: _obscurePassword ? Colors.grey : Colors.orange,
                        ),
                      ),
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
                          Platform.isIOS
                              ? _buildCupertinoButton(
                            screenWidth: screenWidth,
                            screenHeight: screenHeight,
                            text: 'Login',
                            onPressed: _login, // Use the login function
                          )
                              : _buildMaterialButton(
                            screenWidth: screenWidth,
                            screenHeight: screenHeight,
                            text: 'Login',
                            onPressed: _login, // Use the login function
                          ),
                          SizedBox(height: Constants.screenHeightFraction(context, 0.01)),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CreateAccountScreen(),
                                ),
                              );
                            },
                            child: Text.rich(
                              TextSpan(
                                text: "Don't have an account? ",
                                style: Constants.poppins(
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Signup',
                                    style: Constants.poppins(
                                      color: Color(0xFFED4226), // Deep orange color
                                    ),
                                  ),
                                ],
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
        ],
      ),
    );
  }

  Widget _buildCupertinoTextField({
    TextEditingController? controller,
    String? placeholder,
    bool obscureText = false,
    Widget? suffix,
    ValueChanged<String>? onChanged,
    String? Function(String?)? validator, // Add validator
  }) {
    return CupertinoTextField(
      controller: controller,
      placeholder: placeholder,
      obscureText: obscureText,
      onChanged: onChanged,
      padding: EdgeInsets.only(left: 16, right: 40, top: 12, bottom: 12), // Adjusted padding
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
    String? Function(String?)? validator, // Add validator
  }) {
    return TextFormField(
      cursorColor: Colors.black,
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
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
        contentPadding: EdgeInsets.only(left: 16, right: 40, top: 12, bottom: 12), // Adjusted padding
      ),
      validator: validator, // Apply validator
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
