import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redpro_mart/screens/CartScreen.dart';
import 'package:redpro_mart/screens/CheckoutScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../utils/constants.dart';
import 'HomeScreen.dart';

class ProductDetailScreen extends StatefulWidget {
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final List<String> sizes = ['5 Kg', '8 Kg', '10 Kg', '14 Kg', '20 Kg', '30 Kg'];
  final List<String> grades = ['US extra fancy', 'US fancy', 'US No 1', 'US utility'];
  final List<String> imagePaths = [
    'assets/ApplesBanner.png',
    'assets/ApplesBanner.png',
    'assets/ApplesBanner.png',
    'assets/ApplesBanner.png'
  ];
  int _currentPage = 0;
  final PageController _pageController = PageController();
  int _selectedIndex = 0;
  List<bool> selectedSizes = List<bool>.filled(6, false);
  List<bool> selectedGrades = List<bool>.filled(4, false);
  int quantity = 1;

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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
        title: Center(
          child: Text(
            'Product Detail',
            style: GoogleFonts.poppins(

              fontSize: 24,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Container(height: 30,
              padding: EdgeInsets.all(3.0), // Adjust padding as needed
              decoration: BoxDecoration(
                color: Colors.white, // Background color of the circle
                shape: BoxShape.circle, // Circle shape
                border: Border.all(
                  color: Constants.mainAppColor, // Border color
                  width: 1.0, // Border width
                ),
              ),
              child: Icon(
                Icons.more_vert_rounded,
                color: Constants.mainAppColor, // Icon color
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
            style: TextButton.styleFrom(
              overlayColor: Colors.transparent,
            ),
          ),


        ],
      ),
      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: screenWidth * 1.2,
                      height: screenWidth * 0.5,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: imagePaths.length,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            imagePaths[index],
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: imagePaths.length,
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
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Category: ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextSpan(
                          text: 'Apple',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Availability: ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextSpan(
                          text: 'in stock',
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: const Text(
                'Fresh Gala Apples',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: const Row(
                children: [
                  Text(
                    '\$600.72',
                    style: TextStyle(fontSize: 24, color: Colors.red),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    '\$800.00',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  SizedBox(width: 5.0),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star_border, color: Colors.amber),
                  SizedBox(width: 8.0),
                  Text('(04)'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8,right: 8),
              child: const Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s... Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s...',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Quantity Available: ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextSpan(
                      text: '1000',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    _buildSectionTitle('Sizes: '),
                    _buildChips(sizes, selectedSizes),
                  ],
                ),
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    _buildSectionTitle('Grades: '),
                    _buildChips(grades, selectedGrades),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 8,right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSectionTitle('Buy item:'),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline, color: Colors.deepOrange),
                        onPressed: () {
                          setState(() {
                            if (quantity > 1) quantity--;
                          });
                        },
                      ),
                      Text('$quantity'),
                      IconButton(
                        icon: const Icon(Icons.add_circle, color: Colors.deepOrange),
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10,right: 8),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.shopping_bag_outlined),
                      label: const Text('Add to cart'),
                      onPressed: () {
                        // Handle add to cart functionality
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.deepOrange,
                        side: const BorderSide(color: Colors.deepOrange),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: ElevatedButton(
                      child: const Text(
                        'Checkout',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CheckoutScreen()));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(builder: (context) => PaymentSuccessScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }


  Widget _buildChips(List<String> labels, List<bool> selected) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: List<Widget>.generate(labels.length, (int index) {
        return ChoiceChip(
          padding: const EdgeInsets.only(left: 8),
          label: Text(labels[index]),
          selected: selected[index],
          onSelected: (bool selectedValue) {
            setState(() {
              // Ensure only one variation (size or grade) can be selected at a time
              for (int i = 0; i < selected.length; i++) {
                selected[i] = i == index ? selectedValue : false;
              }
            });
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(
              color: selected[index] ? Colors.deepOrange : Colors.grey,
            ),
          ),
          backgroundColor: Colors.white,
          selectedColor: Colors.white,
          checkmarkColor: Colors.red[900],
          labelStyle: TextStyle(
            color: selected[index] ? Colors.deepOrange : Colors.grey,
          ),
        );
      }),
    );
  }
}
