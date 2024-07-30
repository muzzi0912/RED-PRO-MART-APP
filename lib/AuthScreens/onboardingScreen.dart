import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/constants.dart';
import 'SignupScreen.dart';
import 'loginScreen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = Constants.screenWidth(context);
    double screenHeight = Constants.screenHeight(context);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: [
                  Center(
                    child: SizedBox(
                      height: screenHeight * 0.61,
                      child: ImageSlideshow(
                        indicatorBackgroundColor: Colors.white,
                        indicatorColor: Constants.mainAppColor,
                        indicatorRadius: 8,
                        onPageChanged: (index) {
                          setState(() {
                            _current = index;
                          });
                        },
                        children: [
                          Image.asset(
                            'assets/banner1.jpg',
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'assets/banner2.jpg',
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'assets/banner5.jpg',
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10.0,
                    left: 0.0,
                    right: 0.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [],
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.01),
              SafeArea(
                child: Image.asset(
                  'assets/logo_new.png',
                  width: screenWidth * 0.4,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                'Beautiful Ecommerce App for Your Store',
                textAlign: TextAlign.center,
                style: Constants.poppins(
                  fontSize: screenHeight * 0.02,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateAccountScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Constants.buttonColor,
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.2, vertical: screenHeight * 0.02),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Let\'s Get Started',
                  style: Constants.poppins(
                    fontSize: screenHeight * 0.025,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.black,
                    highlightColor: Colors.white,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                      child: Text(
                        'Already have an account?',
                        style: Constants.poppins(
                          fontSize: screenHeight * 0.02,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    icon: Icon(
                      Icons.arrow_circle_right,
                      color: Constants.buttonColor,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}