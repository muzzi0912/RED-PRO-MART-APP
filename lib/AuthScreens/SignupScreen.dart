import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shimmer/shimmer.dart';
import '../Controllers/SignupController.dart';
import '../utils/constants.dart';
import '../utils/responsiveClass.dart';
import 'loginScreen.dart';

class CreateAccountScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final AuthController _authController = Get.put<AuthController>(
      AuthController());

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black.withOpacity(0.8),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void _signup() {
    if (_formKey.currentState!.validate() &&
        _authController.isUsernameValid.value &&
        _authController.isEmailValid.value &&
        _authController.isPhoneValid.value) {
      // Handle signup logic here
      _showToast('Signup successful!');
    } else {
      _showToast('Please fill in all fields correctly.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _buildMobileLayout(context),
      tablet: _buildTabletDesktopLayout(context),
      desktop: _buildTabletDesktopLayout(context),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    final screenWidth = Constants.screenWidth(context);
    final screenHeight = Constants.screenHeight(context);

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: screenHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Signup.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.12),
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
                    SizedBox(height: screenHeight * 0.03),
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              _showImagePickerOptions(context, false);
                            },
                            child: Obx(() =>
                                Container(
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
                                    child: _authController.imageFile.value ==
                                        null
                                        ? Icon(
                                      Icons.camera_alt_outlined,
                                      color: Constants.buttonColor,
                                      size: screenWidth * 0.1,
                                    )
                                        : Image.file(
                                      File(_authController.imageFile.value!
                                          .path),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 204,
                          child: GestureDetector(
                            onTap: () {
                              _showImagePickerOptions(context, true);
                            },
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
                    SizedBox(height: screenHeight * 0.04),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            enableInteractiveSelection: false,
                            keyboardType: TextInputType.text,
                            cursorColor: Constants.mainAppColor,
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a username';
                              } else if (value.length < 3) {
                                return 'Username must be at least 3 characters';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              _authController.validateUsername(value);
                            },
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          TextFormField(
                            enableInteractiveSelection: false,
                            keyboardType: TextInputType.text,
                            cursorColor: Constants.mainAppColor,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: 'Email',
                              suffixIcon: Obx(() =>
                                  Icon(
                                    _authController.isEmailValid.value ? Icons
                                        .check : Icons.error,
                                    color: _authController.isEmailValid.value
                                        ? Colors.green
                                        : Colors.red,
                                  )),
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter an email';
                              } else if (!_authController.isEmailValid.value) {
                                return 'Enter a valid email address';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              _authController.validateEmail(value);
                            },
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Obx(() =>
                              TextFormField(
                                enableInteractiveSelection: false,
                                keyboardType: TextInputType.text,
                                cursorColor: Constants.mainAppColor,
                                obscureText: _authController.obscurePassword
                                    .value,
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
                                    onTap: _authController
                                        .togglePasswordVisibility,
                                    child: Icon(
                                      _authController.obscurePassword.value
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: _authController.obscurePassword
                                          .value ? Colors.grey : Constants
                                          .mainAppColor,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a password';
                                  } else if (value.length < 8) {
                                    return 'Password must be at least 8 characters';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  _authController.password.value = value;
                                },
                              )),
                          SizedBox(height: screenHeight * 0.02),
                          Theme(
                            data: Theme.of(context).copyWith(
                              textSelectionTheme: TextSelectionThemeData(
                                cursorColor: Colors.black,
                                selectionColor: Colors.black.withOpacity(0.5),
                              ),
                              inputDecorationTheme: InputDecorationTheme(
                                hintStyle: TextStyle(color: Colors.black),
                                labelStyle: TextStyle(color: Colors.black),
                                focusColor: Colors.black,
                              ),
                            ),
                            child: IntlPhoneField(
                              cursorColor: Constants.mainAppColor,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(color: Colors.black),
                                labelText: 'Phone Number',
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              initialCountryCode: 'US',
                              onChanged: (phone) {
                                _authController.validatePhone(
                                    phone.completeNumber);
                              },
                              onCountryChanged: (country) {
                                // Handle country change
                              },
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: _signup,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Constants.mainAppColor,
                                fixedSize: Size(screenWidth * 0.8, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'Sign Up',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,

                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account? ',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Log In',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: Constants.mainAppColor,

                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.03),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabletDesktopLayout(BuildContext context) {
    final screenWidth = Constants.screenWidth(context);
    final screenHeight = Constants.screenHeight(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Red container with text and button
            Container(
              width: double.infinity,
              color: Colors.red,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Summer sale for all swim suits and free express delivery - Off 50%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Add your navigation code here
                    },
                    child: Text(
                      'SHOP NOW',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            // Top navigation bar
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Logo
                      Image.asset(
                        'assets/Logo.png', // Path to your logo image
                        width: screenWidth * 0.1,
                        fit: BoxFit.contain,
                      ),
                      // Search bar
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search',
                              filled: true,
                              fillColor: Colors.grey[200], // Changed fill color to grey
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              suffixIcon: Icon(Icons.search, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      // Account options
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              // Navigate to login
                            },
                            child: Text('Login', style: TextStyle(color: Colors.black)),
                          ),
                          TextButton(
                            onPressed: () {
                              // Navigate to create account
                            },
                            child: Text('Create Account', style: TextStyle(color: Colors.black)),
                          ),
                          IconButton(
                            onPressed: () {
                              // Navigate to cart
                            },
                            icon: Icon(Icons.shopping_cart, color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(width: double.infinity,
                      child: Divider()), // Divider below the white container
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
              child: Row(
                children: [
                  // New image on the left side
                  Image.asset('assets/Rectangle 23.png', width: screenWidth * 0.4, fit: BoxFit.cover),
                  SizedBox(width: screenWidth * 0.04),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: screenHeight * 0.1),
                          Shimmer.fromColors(
                            baseColor: Colors.black,
                            highlightColor: Colors.white,
                            child: Text(
                              'Create Account',
                              style: GoogleFonts.poppins(
                                fontSize: screenWidth * 0.025,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  enableInteractiveSelection: false,
                                  keyboardType: TextInputType.text,
                                  cursorColor: Constants.mainAppColor,
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
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a username';
                                    } else if (value.length < 8) {
                                      return 'Username must be at least 8 characters';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    _authController.validateUsername(value);
                                  },
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                TextFormField(
                                  enableInteractiveSelection: false,
                                  keyboardType: TextInputType.text,
                                  cursorColor: Constants.mainAppColor,
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(color: Colors.black),
                                    labelText: 'Email',
                                    suffixIcon: Obx(() => Icon(
                                      _authController.isEmailValid.value ? Icons.check : Icons.error,
                                      color: _authController.isEmailValid.value ? Colors.green : Colors.red,
                                    )),
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter an email';
                                    } else if (!_authController.isEmailValid.value) {
                                      return 'Enter a valid email address';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    _authController.validateEmail(value);
                                  },
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                Obx(() => TextFormField(
                                  enableInteractiveSelection: false,
                                  keyboardType: TextInputType.text,
                                  cursorColor: Constants.mainAppColor,
                                  obscureText: _authController.obscurePassword.value,
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
                                      onTap: _authController.togglePasswordVisibility,
                                      child: Icon(
                                        _authController.obscurePassword.value ? Icons.visibility_off : Icons.visibility,
                                        color: _authController.obscurePassword.value ? Colors.grey : Constants.mainAppColor,
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a password';
                                    } else if (value.length < 8) {
                                      return 'Password must be at least 8 characters';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    _authController.password.value = value;
                                  },
                                )),
                                SizedBox(height: screenHeight * 0.02),
                                Theme(
                                  data: Theme.of(context).copyWith(
                                    textSelectionTheme: TextSelectionThemeData(
                                      cursorColor: Colors.black,
                                      selectionColor: Colors.black.withOpacity(0.5),
                                    ),
                                    inputDecorationTheme: InputDecorationTheme(
                                      hintStyle: TextStyle(color: Colors.black),
                                      labelStyle: TextStyle(color: Colors.black),
                                      focusColor: Colors.black,
                                    ),
                                  ),
                                  child: IntlPhoneField(
                                    cursorColor: Constants.mainAppColor,
                                    decoration: InputDecoration(
                                      labelStyle: TextStyle(color: Colors.black),
                                      labelText: 'Phone Number',
                                      filled: true,
                                      fillColor: Colors.grey[200],
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    initialCountryCode: 'US',
                                    onChanged: (phone) {
                                      _authController.validatePhone(phone.completeNumber);
                                    },
                                    onCountryChanged: (country) {
                                      // Handle country change
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft, // Align button to the left
                                  child: ElevatedButton(
                                    onPressed: _signup,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Constants.mainAppColor,
                                      fixedSize: Size(screenWidth * 0.1, 40), // Reduced width of the button
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Text(
                                      'Sign Up',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16, // Adjusted font size
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Already have an account?",
                                      style: GoogleFonts.poppins(fontSize: 16),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Get.to(LoginScreen());
                                      },
                                      child: Text(
                                        "Log in",
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Constants.mainAppColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
    );
  }




  void _showImagePickerOptions(BuildContext context, bool isUpdate) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Camera'),
              onTap: () {
                _pickImage(ImageSource.camera, isUpdate);
              },
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Gallery'),
              onTap: () {
                _pickImage(ImageSource.gallery, isUpdate);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source, bool isUpdate) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: source);

    if (image != null) {
      // if (isUpdate) {
      //   _authController.updateImageFile(image);
      // } else {
      //   _authController.setImageFile(image);
      // }
    }
    Navigator.of(Get.context!).pop();
  }
}
