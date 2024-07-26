import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String selectedFruit = 'All';
  String selectedVegetable = 'All';
  String selectedSort = 'Most Recent';
  String selectedReview = '4.5 and above';
  RangeValues _currentRangeValues = RangeValues(2, 100);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(   backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0.0,
        title: Text(
          'Filter',
          style: GoogleFonts.poppins(),
        ),
        leading:   GestureDetector(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => HomeScreen()),
           // );
          },
          child: Image.asset(
            'assets/backButton.png', // Replace with your back button image path
            height: 30,
            width: 30,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fruits',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 8.0,
                      children: _buildChips(
                          ['All', 'Apple', 'Banana', 'Papaya', 'Mango','Apple', 'Banana', 'Papaya', 'Mango'], 'fruit'),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Text(
                    'Vegetables',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 15.0,
                      children: _buildChips(
                          ['All', 'Tomato', 'Potato', 'Chili', 'Mint','Potato', 'Chili', 'Mint'], 'vegetable'),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Text(
                    'Sort by',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 8.0,
                      children: _buildChips(
                          ['Most Recent', 'Popular', 'Price High', 'Price Low'], 'sort'),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Text(
                    'Price Range',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  RangeSlider(
                    values: _currentRangeValues,
                    min: 0,
                    max: 150,
                    divisions: 150,
                    activeColor: Color(0xFFED4226),
                    inactiveColor: Colors.grey,
                    labels: RangeLabels(
                      _currentRangeValues.start.round().toString(),
                      _currentRangeValues.end.round().toString(),
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _currentRangeValues = values;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Min: ${_currentRangeValues.start.round()}',
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Text(
                          'Max: ${_currentRangeValues.end.round()}',
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Text(
                    'Reviews',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  _buildReviewOptions(),
                  SizedBox(height: screenHeight * 0.1), // Adding space for the fixed container
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: screenWidth * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Reset filter logic
                    },
                    child: Text(
                      'Reset Filter',
                      style: GoogleFonts.poppins(),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffe34126),
                      padding: EdgeInsets.symmetric(vertical: 9, horizontal: 45), // Adjust padding for button size
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Apply', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildChips(List<String> labels, String type) {
    return labels.map((label) {
      return GestureDetector(
        onTap: () {
          setState(() {
            if (type == 'fruit') {
              selectedFruit = label;
            } else if (type == 'vegetable') {
              selectedVegetable = label;
            } else if (type == 'sort') {
              selectedSort = label;
            }
          });
        },
        child: Chip(
          label: Text(
            label,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: _getChipLabelColor(label, type),
              ),
            ),
          ),
          backgroundColor: _getChipBackgroundColor(label, type),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Color(0xFFED4226)),
          ),
        ),
      );
    }).toList();
  }

  Color _getChipBackgroundColor(String label, String type) {
    if ((type == 'fruit' && label == selectedFruit) ||
        (type == 'vegetable' && label == selectedVegetable) ||
        (type == 'sort' && label == selectedSort)) {
      return Color(0xFFED4226);
    }
    return Colors.white;
  }

  Color _getChipLabelColor(String label, String type) {
    if ((type == 'fruit' && label == selectedFruit) ||
        (type == 'vegetable' && label == selectedVegetable) ||
        (type == 'sort' && label == selectedSort)) {
      return Colors.white;
    }
    return Colors.black;
  }

  Widget _buildReviewOptions() {
    return Column(
      children: [
        _buildReviewOption('4.5 and above'),
        _buildReviewOption('4.0 - 4.5'),
        _buildReviewOption('3.5 - 4.0'),
        _buildReviewOption('3.0 - 3.5'),
        _buildReviewOption('5 stars'),
      ],
    );
  }

  Widget _buildReviewOption(String text) {
    return Row(
      children: [
        Icon(Icons.star, color: Colors.amber),
        Icon(Icons.star, color: Colors.amber),
        Icon(Icons.star, color: Colors.amber),
        Icon(Icons.star, color: Colors.amber),
        Icon(Icons.star, color: Colors.amber),
        SizedBox(width: 8),
        Text(
          text,
          style: GoogleFonts.poppins(),
        ),
        Spacer(),
        Radio(
          value: text,
          groupValue: selectedReview,
          activeColor: Color(0xFFED4226),
          onChanged: (value) {
            setState(() {
              selectedReview = value.toString();
            });
          },
        ),
      ],
    );
  }
}
