import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redpro_mart/screens/profileScreen.dart';
import 'package:redpro_mart/screens/searchScreen.dart';
import 'package:redpro_mart/screens/wishlistScreen.dart';
import '../Widgets/bottomNavBar.dart';
import 'CartScreen.dart';
import 'HomeScreen.dart';

class Termsandconditions extends StatefulWidget {
  @override
  State<Termsandconditions> createState() => _TermsandconditionsState();
}

class _TermsandconditionsState extends State<Termsandconditions> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
    WishlistScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => _widgetOptions[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar( title: Text('Terms & Conditions',style: GoogleFonts.poppins(
        fontSize: 24,)),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          },
          child: Image.asset(
            'assets/backButton.png', // Replace with your back button image path
            height: 30,
            width: 40,
          ),
        ),

      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Terms and Conditions',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                      'Pellentesque ut quam tincidunt, vulputate dolor sit amet, '
                      'ultricies leo. Curabitur vehicula odio id suscipit aliquet. '
                      'Vestibulum ante ipsum primis in faucibus orci luctus et '
                      'ultrices posuere cubilia curae; Integer nec ex eu sapien '
                      'pellentesque ultricies. Donec euismod magna nec turpis '
                      'volutpat, sit amet ullamcorper magna blandit.',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                  ),
                ),

                SizedBox(height: 10),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                      'Pellentesque ut quam tincidunt, vulputate dolor sit amet, '
                      'ultricies leo. Curabitur vehicula odio id suscipit aliquet.',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                  ),
                ),


                SizedBox(height: 10),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                      'Pellentesque ut quam tincidunt, vulputate dolor sit amet, '
                      'ultricies leo. Curabitur vehicula odio id suscipit aliquet.',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                  ),

                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                      'Pellentesque ut quam tincidunt, vulputate dolor sit amet, '
                      'ultricies leo. Curabitur vehicula odio id suscipit aliquet.',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                  ),

                ),   Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                      'Pellentesque ut quam tincidunt, vulputate dolor sit amet, '
                      'ultricies leo. Curabitur vehicula odio id suscipit aliquet.',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                  ),

                ),   Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                      'Pellentesque ut quam tincidunt, vulputate dolor sit amet, '
                      'ultricies leo. Curabitur vehicula odio id suscipit aliquet.',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                  ),

                ),   Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                      'Pellentesque ut quam tincidunt, vulputate dolor sit amet, '
                      'ultricies leo. Curabitur vehicula odio id suscipit aliquet.',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                  ),

                ),


              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: PersistentBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
