import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    //FavoritesScreen(),
    //ProfileScreen(),
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
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.bag),
            onPressed: () {},
            style: TextButton.styleFrom(
              overlayColor: Colors.transparent,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Text(
                      'Shop by:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
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
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: 10, // Adjust the number of items
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductCardDuplicate(
                        imagePath: 'assets/Rectangle 12.png', // Replace with your image path
                        title: 'Bananas: Yellow Plantai',
                        subtitle: 'Approx 70lb',
                        rating: 4.5, // Example rating
                        price: 20.0, // Example price
                      ),
                    );
                  },
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
