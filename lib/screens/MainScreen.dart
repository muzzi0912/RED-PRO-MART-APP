import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:redpro_mart/screens/HomeScreen.dart';
import '../utils/constants.dart';


class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Images
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/bubble 7.png', // Replace with your image path
              width: 200,
              height: 350,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 200,
            left: 0,
            child: Image.asset(
              'assets/bubble 8.png', // Replace with your image path
              width: 250,
              height: 450,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Card(
                color: Colors.white,
                margin: EdgeInsets.all(10),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // PageView with Smooth Page Indicator
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        children: [
                          Image.asset('assets/fruit_counter1.jpg', fit: BoxFit.cover),
                          Image.asset('assets/pngtree.png', fit: BoxFit.cover),
                          Image.asset('assets/fruit_counter1.jpg', fit: BoxFit.cover),
                          Image.asset('assets/pngtree.png', fit: BoxFit.cover),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Hello Sir/Maam,',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10),
                    // Dummy Data
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    // Smooth Page Indicator
                    AnimatedSmoothIndicator(
                      activeIndex: _currentPage,
                      count: 4,
                      effect: WormEffect(activeDotColor:Colors.deepOrange,),
                    ),
                    SizedBox(height: Constants.screenHeightFraction(context, 0.03)),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                        // Handle cancel logic
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(fontSize: 20,color: Colors.black),
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
}
