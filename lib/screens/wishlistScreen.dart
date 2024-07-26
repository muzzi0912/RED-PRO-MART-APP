import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redpro_mart/screens/profileScreen.dart';
import 'package:redpro_mart/screens/searchScreen.dart';
import '../Widgets/ProductCardDuplicate.dart';
import '../Widgets/bottomNavBar.dart';
import '../utils/constants.dart';
import 'CartScreen.dart';
import 'HomeScreen.dart';

class WishlistScreen extends StatefulWidget {
  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  int _selectedIndex = 0;
  int _selectedChoiceIndex = 0; // Add this to track the selected choice chip

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

  void _onChoiceSelected(int index) {
    setState(() {
      _selectedChoiceIndex = index;
    });
    // Add your logic for filtering based on selected choice
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    List<String> choices = ["All", "Fruits", "Vegetables", "Deals", "New"];

    return Scaffold(
      appBar: AppBar(title: Text('Wishlist',style: GoogleFonts.poppins(
        fontSize: 24,)),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0.0,
      leading:  GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen()),
          );
        },
        child: Image.asset(
          'assets/backButton.png', // Replace with your back button image path
          height: 30,
          width: 30,
        ),
      ),

      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left:10.0),
                  child: Text(
                    'Shop by:  ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(choices.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: ChipTheme(
                            data: ChipThemeData(
                              showCheckmark: false,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                            child: ChoiceChip(
                              label: Text(choices[index]),
                              selected: _selectedChoiceIndex == index,
                              onSelected: (bool selected) {
                                _onChoiceSelected(index);
                              },
                              selectedColor: Colors.white,
                              backgroundColor: Colors.white,
                              side: BorderSide(
                                color: _selectedChoiceIndex == index
                                    ? Colors.grey
                                    : Colors.grey,
                              ),
                              avatar: _selectedChoiceIndex == index
                                  ? Image.asset(
                                'assets/Vector.png',
                                height: 25,
                                width: 25,
                              ) // Replace with your star image path
                                  : null,
                              labelStyle: TextStyle(
                                color: _selectedChoiceIndex == index
                                    ? Colors.deepOrange
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: ProductCardDuplicate(
                                imagePath: index % 2 == 0
                                    ? 'assets/grapes12.png'
                                    : 'assets/BananaCards.png',
                                title: index % 2 == 0 ? 'Grapes' : 'Bananas',
                                subtitle: index % 2 == 0 ? 'Approx. 40lb' : 'Approx. 1lb',
                                rating: index % 2 == 0 ? 4.5 : 4.2,
                                price: index % 2 == 0 ? 2.99 : 0.99,
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: ProductCardDuplicate(
                                imagePath: index % 2 == 0
                                    ? 'assets/BananaCards.png'
                                    : 'assets/grapes12.png',
                                title: index % 2 == 0 ? 'Bananas' : 'Grapes',
                                subtitle: index % 2 == 0 ? 'Approx. 1lb' : 'Approx. 40lb',
                                rating: index % 2 == 0 ? 4.2 : 4.5,
                                price: index % 2 == 0 ? 0.99 : 2.99,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: PersistentBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
