import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shimmer/shimmer.dart';
import '../Controllers/SignupController.dart';
import '../utils/constants.dart';
import 'loginScreen.dart';

class CreateAccountScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final AuthController _authController = Get.put<AuthController>(AuthController());
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
                    SizedBox(
                        height: Constants.screenHeightFraction(context, 0.12)),
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
                    SizedBox(
                        height: Constants.screenHeightFraction(context, 0.03)),
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
                                    child: _authController.imageFile.value == null
                                        ? Icon(
                                      Icons.camera_alt_outlined,
                                      color: Constants.buttonColor,
                                      size: screenWidth * 0.1,
                                    )
                                        : Image.file(
                                      File(_authController.imageFile.value!.path),
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
                    SizedBox(
                        height: Constants.screenHeightFraction(context, 0.04)),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(                            enableInteractiveSelection: false,
                            keyboardType: TextInputType.text,
                            cursorColor: Constants.mainAppColor, // Custom cursor color
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
                                return 'Username must be at least 8 characters';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              _authController.validateUsername(value);
                            },
                          ),
                          SizedBox(height: Constants.screenHeightFraction(
                              context, 0.02)),
                          TextFormField(                            enableInteractiveSelection: false,
                            keyboardType: TextInputType.text,
                            cursorColor: Constants.mainAppColor, // Custom cursor color
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: 'Email',
                              suffixIcon: Obx(() =>
                                  Icon(
                                    _authController.isEmailValid.value
                                        ? Icons.check
                                        : Icons.error,
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
                          SizedBox(height: Constants.screenHeightFraction(
                              context, 0.02)),
                          Obx(() =>
                              TextFormField(                            enableInteractiveSelection: false,
                                keyboardType: TextInputType.text,
                                cursorColor: Constants.mainAppColor,
                                // Custom cursor color
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
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: _authController.obscurePassword.value
                                          ? Constants.mainAppColor
                                          : Colors.grey,
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
                          SizedBox(height: Constants.screenHeightFraction(
                              context, 0.02)),
                          Theme(
                            data: Theme.of(context).copyWith(
                              textSelectionTheme: TextSelectionThemeData(
                                cursorColor: Colors.black,
                                selectionColor: Colors.black.withOpacity(0.5),
                              ),
                              inputDecorationTheme: InputDecorationTheme(
                                  hintStyle: TextStyle(color: Colors.black),
                                  labelStyle: TextStyle(color: Colors.black),
                                  focusColor: Colors.black
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
                          SizedBox(height: Constants.screenHeightFraction(
                              context, 0.01)),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                // Navigate to the login screen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Already have an account?',
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: Constants.screenHeightFraction(
                              context, 0.02)),
                          ElevatedButton(
                            onPressed: _signup,
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
                              'Sign Up',
                              style: GoogleFonts.poppins(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 20,)
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



  Future<void> _showImagePickerOptions(BuildContext context, bool openGallery) async {
    final ImagePicker _picker = ImagePicker();

    if (openGallery) {
      // Open the gallery directly
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        _authController.imageFile.value = pickedFile;
      }
    } else {
      // Show dialog for camera or gallery
      final XFile? pickedFile = await showDialog<XFile>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Choose an option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () async {
                  Navigator.pop(context); // Close the dialog
                  // Check and request camera permission
                  PermissionStatus cameraStatus = await Permission.camera.status;
                  if (cameraStatus.isGranted) {
                    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
                    if (pickedFile != null) {
                      _authController.imageFile.value = pickedFile;
                    }
                  } else {
                    // Request camera permission
                    cameraStatus = await Permission.camera.request();
                    if (cameraStatus.isGranted) {
                      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
                      if (pickedFile != null) {
                        _authController.imageFile.value = pickedFile;
                      }
                    } else {
                      _showToast('Camera permission is required to take pictures.');
                    }
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text('Gallery'),
                onTap: () async {
                  Navigator.pop(context); // Close the dialog
                  final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    _authController.imageFile.value = pickedFile;
                  }
                },
              ),
            ],
          ),
        ),
      );
    }
  }




}