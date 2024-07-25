import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:redpro_mart/screens/CategoriesScreen.dart';
import 'package:redpro_mart/screens/FeaturedDealsScreen.dart';
import 'package:redpro_mart/screens/ProductDetailScreen.dart';
import 'package:redpro_mart/screens/ProductListing.dart';
import 'package:redpro_mart/screens/Recommendations.dart';
import 'package:redpro_mart/screens/profileScreen.dart';
import 'package:redpro_mart/screens/searchScreen.dart';
import 'package:redpro_mart/screens/wishlistScreen.dart';
import 'package:shimmer/shimmer.dart';
import '../Widgets/Featureddealwidget.dart';
import '../Widgets/ProductCardWidget.dart' as WidgetProductCard;
import '../Widgets/bottomNavBar.dart';
import '../utils/constants.dart';
import 'CartScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
    WishlistScreen(),
    ProfileScreen(),
  ];
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
    double screenHeight = Constants.screenHeight(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF970000),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductDetailScreen()),
            );
          },   style: TextButton.styleFrom(
          overlayColor: Colors.transparent,
        ),
        ),
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.bag,color: Colors.white,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },   style: TextButton.styleFrom(
            overlayColor: Colors.transparent,
          ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  height: MediaQuery.of(context).size.height * 0.28,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Rectangle122.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AnimatedTextKit(
                              animatedTexts: [
                                TyperAnimatedText(
                                  'Fresh Fruits - Marketplace,',
                                  textStyle:  GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                                TyperAnimatedText(
                                  'Fruit Basket - Your Fresh Fruit Destination',
                                  textStyle:  GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TyperAnimatedText(
                                  'Natures Bounty - Fresh Fruits For you',
                                  textStyle: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                              onTap: () {
                                print("I am executing");
                              },
                            ),
                            SizedBox(height: 10),
                            OutlinedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SearchScreen(),
                                  ),
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white.withOpacity(0.26),
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                side: BorderSide.none,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Shimmer.fromColors(
                                    period: Duration(milliseconds: 1000),
                                    baseColor: Colors.white,
                                    highlightColor: Colors.white.withOpacity(0.30),
                                    child: Text(
                                      'Discover More',
                                      style: GoogleFonts.poppins(color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.20),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      'assets/arrow-right.png',
                                      color: Colors.white,
                                      width: 24,
                                      height: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextField(
                          cursorColor: Colors.black,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            hintText: "Search...",
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search, color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(vertical: 12), // Adjust the vertical padding
                          ),
                        ),
                      ),
                      SizedBox(height: 5,)

                    ],
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ImageSlideshow(
                    indicatorBackgroundColor: Colors.white,
                    indicatorColor: Constants.mainAppColor,
                    indicatorRadius: 4,
                    autoPlayInterval:3000,
                    isLoop: true,// Auto play interval set to 3 seconds
    onPageChanged: (index) {
                      setState(() {
                        _current = index;
                      });
                    },
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0), // Adjust spacing here
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/fruitBanner.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0), // Adjust spacing here
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/fruitBanner2.webp',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0), // Adjust spacing here
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/fruitBanner3.webp',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Shimmer.fromColors(
                        period: Duration(milliseconds: 1000),
                        baseColor: Colors.black,
                        highlightColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left:10),
                          child: Text(
                            'Categories',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      // Pushes the See All button to the right
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CategoryScreen()),
                          );
                        },   style: TextButton.styleFrom(
                        overlayColor: Colors.transparent,
                      ),
                        child: Padding(
                          padding: const EdgeInsets.only(left:20,),
                          child: Row(
                            children: [
                              Text(
                                'See All',
                                style:  GoogleFonts.poppins(
                                  color: Constants.mainAppColor,
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Constants.mainAppColor,
                                size: 12,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                    // SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left:10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [

                            _buildCategoryCircle(
                                context, 'assets/bananaIcon.png', 'Banana'),
                            SizedBox(width: 20),
                            _buildCategoryCircle(
                                context, 'assets/orangeIcon.png', 'Orange'),
                            SizedBox(width: 20),
                            _buildCategoryCircle(
                                context, 'assets/amrood.png', 'Avocado'),
                            SizedBox(width: 20),
                            _buildCategoryCircle(
                                context, 'assets/pearIcon.png', 'Papaya'),
                            SizedBox(width: 20),
                            _buildCategoryCircle(
                                context, 'assets/appleBag.png', 'Apple'),
                            SizedBox(width: 20),
                            _buildCategoryCircle(
                                context, 'assets/bananaIcon.png', 'Banana'),
                            SizedBox(width: 20),
                            _buildCategoryCircle(
                                context, 'assets/orangeIcon.png', 'Orange'),
                            SizedBox(width: 20),
                            _buildCategoryCircle(
                                context, 'assets/amrood.png', 'Avocado'),
                            SizedBox(width: 20),
                            _buildCategoryCircle(
                                context, 'assets/pearIcon.png', 'Papaya'),
                            SizedBox(width: 20),
                            _buildCategoryCircle(
                                context, 'assets/appleBag.png', 'Apple'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Shimmer.fromColors(
                        period: Duration(milliseconds: 1000),
                        baseColor: Colors.black,
                        highlightColor: Colors.white,
                        child: Text(
                          'Trending Products',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ProductListingScreen()),
                              );
                            },   style: TextButton.styleFrom(
                            overlayColor: Colors.transparent,
                          ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'See All',
                                  style:  GoogleFonts.poppins(
                                    color: Constants.mainAppColor,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Constants.mainAppColor,
                                  size: 12,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  height: 240,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: WidgetProductCard.ProductCard(
                          imagePath: 'assets/download.png',
                          title: 'Grapes: Yellow Plantai',
                          subtitle: 'Approx:lb',
                          rating: 4.5,
                          price: 2.99,
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Shimmer.fromColors(
    period: Duration(milliseconds: 1000),  // Adjusted duration (2 seconds)

                      baseColor: Colors.black,
                    highlightColor: Colors.white,
                    child: Text(
                      'Featured Deals',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ), ),

                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FeaturedDealsScreen()),
                          );
                        },   style: TextButton.styleFrom(
                        overlayColor: Colors.transparent,
                      ),
                        child: Row(
                          children: [
                            Text(
                              'See All',
                              style:  GoogleFonts.poppins(
                                color: Constants.mainAppColor,
                              ),
                            ),
                            SizedBox(width: 3),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Constants.mainAppColor,
                              size: 12,
                            ),
                          ],
                        ),
                      ),
                  ],
                  ),
                ),
                Container(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Featureddealwidget(
                          imagePath: 'assets/BananaCards.png',
                          title: 'Banana: Yellow Plantai',
                          subtitle: 'Approx.40lb',
                          price: 2.99,
                          rating: 4,
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [

                   Text(
                        'Recommendations',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Recommendations()),
                          );
                        },   style: TextButton.styleFrom(
                        overlayColor: Colors.transparent,
                      ),

                        child: Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                            Text(
                              'See All',
                              style:  GoogleFonts.poppins(
                                color: Constants.mainAppColor,
                              ),
                             ),
                            SizedBox(width: 3),

                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Constants.mainAppColor,
                              size: 12,
                            ),
                        ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Featureddealwidget(
                          imagePath: 'assets/BananaCards.png',
                          title: 'Banana: Yellow Plantai',
                          subtitle: 'Approx.40lb',
                          price: 2.99,
                          rating: 4,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30,)

              ],

            ),
              ),

        ],
      ),

      bottomNavigationBar: PersistentBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }


  Widget _buildCategoryCircle(BuildContext context, String assetPath,
      String label) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductListingScreen()),
        );
      },
      child: Column(mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.zero,
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Constants.mainAppColor),
            ),
            child: Center(
              child: ClipOval(
                child: Image.asset(
                  assetPath,
                  fit: BoxFit.contain,
                  width: 30, // Adjust width as necessary
                  height: 30, // Adjust height as necessary
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style:  GoogleFonts.poppins(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
