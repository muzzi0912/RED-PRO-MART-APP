import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';
import 'WelcomeScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    // Navigate to the next screen after a delay
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),  // Replace with your home screen
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ScaleTransition(
              scale: _animation,
              child: Image.asset(
                'assets/new_logo.png',  // Replace with your logo asset path
                width: 250,
                height: 250,
              ),
            ),
            SizedBox(height: 20),
            FadeAnimatedTextKit(
              text: ['RED PRO MART'],
              textStyle: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  color: Constants.mainAppColor,
                ),
              ).copyWith(
                letterSpacing: 2.0,
                fontSize: 26.0,
                textBaseline: TextBaseline.alphabetic,
              ),
              isRepeatingAnimation: true,
              repeatForever: true,
              textAlign: TextAlign.start,
             // alignment: AlignmentDirectional.topStart,
            ),
          ],
        ),
      ),
    );
  }
}
