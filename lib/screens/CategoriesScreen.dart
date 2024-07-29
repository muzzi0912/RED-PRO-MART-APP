import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redpro_mart/screens/profileScreen.dart';
import 'package:redpro_mart/screens/searchScreen.dart';
import 'package:redpro_mart/screens/wishlistScreen.dart';
import '../Widgets/ProductCardDuplicate.dart';
import '../Widgets/bottomNavBar.dart';
import '../utils/constants.dart';
import 'CartScreen.dart';
import 'HomeScreen.dart';

class CategoryScreen extends StatefulWidget {
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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

  int _currentPage = 0;
  final PageController _pageController = PageController();
  int _current = 0;

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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    List<String> choices = ["All", "Fruits", "Vegetables", "Deals", "New"];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Categories',
          style: GoogleFonts.poppins(fontSize: 24),
        ),
        centerTitle: true,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    enableInteractiveSelection: false,
                    keyboardType: TextInputType.text,
                    cursorColor: Constants.textColor,
                    decoration: InputDecoration(
                      hintText: 'Search here',
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ),
                SizedBox(height: 10),
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
                                    color: _selectedChoiceIndex == index ? Colors.grey : Colors.grey,
                                  ),
                                  avatar: _selectedChoiceIndex == index
                                      ? Image.asset('assets/Vector.png', height: 25, width: 25) // Replace with your star image path
                                      : null,
                                  labelStyle: TextStyle(
                                    color: _selectedChoiceIndex == index ? Colors.deepOrange : Colors.grey,
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
                ImageSlideshow(
                  indicatorBackgroundColor: Colors.white,
                  indicatorColor: Constants.mainAppColor,
                  indicatorRadius: 4,
                  autoPlayInterval: 3000,
                  isLoop: true, // Auto play interval set to 3 seconds
                  onPageChanged: (index) {
                    setState(() {
                      _current = index;
                    });
                  },
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8), // Adjusted padding here
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/Category1.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8), // Adjusted padding here
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/Category2.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8), // Adjusted padding here
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/Category3.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5, // Adjust the number of rows
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: ProductCardDuplicate(
                                  imagePath: 'assets/Rectangle 12.png', // Replace with your image path
                                  title: 'Bananas: Yellow Plantain',
                                  subtitle: 'Approx 70lb',
                                  rating: 4.5, // Example rating
                                  price: 20.0, // Example price
                                ),
                              ),
                            ),
                            SizedBox(width:10 ), // Adjust horizontal spacing
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: ProductCardDuplicate(
                                  imagePath: 'assets/Rectangle 12.png', // Replace with your image path
                                  title: 'Bananas: Yellow Plantain',
                                  subtitle: 'Approx 70lb',
                                  rating: 4.5, // Example rating
                                  price: 20.0, // Example price
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                       // Adjust vertical spacing
                      ],
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
