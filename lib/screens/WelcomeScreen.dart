import 'package:flutter/material.dart';
import 'package:redpro_mart/AuthScreens/SignupScreen.dart';
import 'package:redpro_mart/main.dart';
import 'package:redpro_mart/utils/responsive.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shimmer/shimmer.dart';
import '../AuthScreens/loginScreen.dart';
import '../utils/constants.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = ResponsiveUtil.getScreenWidth(context);
    double screenHeight = ResponsiveUtil.getScreenHeight(context);
    double containerWidth = screenWidth * 0.5;
    double containerHeight = screenHeight * 0.3;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.1),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  buildPage(screenWidth, screenHeight, containerWidth, containerHeight),
                  buildPage(screenWidth, screenHeight, containerWidth, containerHeight),
                  buildPage(screenWidth, screenHeight, containerWidth, containerHeight),
                  buildPage(screenWidth, screenHeight, containerWidth, containerHeight),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            AnimatedSmoothIndicator(
              activeIndex: _currentPage,
              count: 4,
              effect: ExpandingDotsEffect(
                activeDotColor: Constants.sliderColor,
                dotHeight: screenHeight * 0.01,
                dotWidth: screenHeight * 0.01,
              ),
              onDotClicked: (index) {
                _pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
            ),
            SizedBox(height: screenHeight * 0.08),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(title: '')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Constants.buttonColor,
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.35,
                  vertical: screenHeight * 0.02,
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
            SizedBox(height: screenHeight * 0.02),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              style: TextButton.styleFrom(
                overlayColor: Colors.transparent,
              ),
              child: Text(
                'Skip',
                style: TextStyle(
                  fontSize: screenHeight * 0.02,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.06),
          ],
        ),
      ),
    );
  }

  Widget buildPage(double screenWidth, double screenHeight, double containerWidth, double containerHeight) {
    return Column(
      children: [
        Text(
          'MARKETPLACE',
          style: Constants.poppins(
            color: Constants.textColor,
            fontSize: screenHeight * 0.04,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Shimmer.fromColors(
          baseColor: Constants.textColor,
          highlightColor: Colors.white,
          child: Text(
            'Red Pro Mart',
            style: Constants.poppins(
              fontSize: screenHeight * 0.03,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: screenHeight * 0.03),
        Stack(
          children: [
            Center(
              child: Container(
                width: containerWidth,
                height: containerHeight,
                decoration: BoxDecoration(
                  color: Colors.pink[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/Logo.png',
                    width: screenWidth * 0.3,
                  ),
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.08,
              top: (screenHeight * 0.15) - (containerHeight * 0.4),
              child: Column(
                children: [
                  Image.asset('assets/cartlogo4.png', width: screenWidth * 0.1),
                  SizedBox(height: screenHeight * 0.06),
                  Image.asset('assets/cartlogo3.png', width: screenWidth * 0.1),
                  SizedBox(height: screenHeight * 0.06),
                  Image.asset('assets/cartlogo2.png', width: screenWidth * 0.1),
                ],
              ),
            ),
            Positioned(
              right: screenWidth * 0.08,
              top: (screenHeight * 0.15) - (containerHeight * 0.4),
              child: Column(
                children: [
                  Image.asset('assets/cartlogo5.png', width: screenWidth * 0.1),
                  SizedBox(height: screenHeight * 0.06),
                  Image.asset('assets/cartlogo6.png', width: screenWidth * 0.1),
                  SizedBox(height: screenHeight * 0.06),
                  Image.asset('assets/cartlogo1.png', width: screenWidth * 0.1),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.05),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
          child: Text(
            'Welcome to Red Pro Mart, your one-stop solution for all your shopping needs.',
            style: Constants.poppins(
              color: Colors.grey,
              fontSize: screenHeight * 0.02,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
