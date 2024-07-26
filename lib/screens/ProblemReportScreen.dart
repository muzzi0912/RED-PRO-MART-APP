import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:redpro_mart/screens/profileScreen.dart';

class ProblemReportScreen extends StatefulWidget {
  @override
  _ProblemReportScreenState createState() => _ProblemReportScreenState();
}

class _ProblemReportScreenState extends State<ProblemReportScreen> {
  String selectedProblem = '';
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _selectedImages = [];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0.0,
        title: Text(
          'Tell us the Problem',
          style: GoogleFonts.poppins(),
        ),
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
            width: 30,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline),
            onPressed: () {
              // Help action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 8.0,
                children: _buildProblemChips([
                  'Chat',
                  'Review',
                  'Orders Finder',
                  'File can\'t play',
                  'Add to cart',
                  'App Slow',
                  'Others'
                ]),
              ),
              SizedBox(height: screenHeight * 0.04),
              Text(
                'Details *',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              TextField(
                maxLines: 5,
                cursorColor: Color(0xFFED4226),
                decoration: InputDecoration(
                  hintText: 'Explain What Happened, or suggestion',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFED4226)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                style: GoogleFonts.poppins(),
              ),
              SizedBox(height: screenHeight * 0.04),
              Text(
                'Screenshots OR Videos (Optional)',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              GestureDetector(
                onTap: () async {
                  final List<XFile>? images = await _picker.pickMultiImage();
                  if (images != null && images.isNotEmpty) {
                    setState(() {
                      _selectedImages = images;
                    });
                  }
                },
                child: Container(
                  height: screenHeight * 0.13,
                  width: screenHeight * 0.13,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Icon(Icons.add, size: 40, color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              _selectedImages != null && _selectedImages!.isNotEmpty
                  ? Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: _selectedImages!.map((image) {
                  return Image.file(
                    File(image.path),
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  );
                }).toList(),
              )
                  : Container(),
              SizedBox(height: screenHeight * 0.04),
              Text(
                'Email Address (Optional)',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              TextField(
                cursorColor: Color(0xFFED4226),
                decoration: InputDecoration(
                  hintText: 'Email Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFED4226)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                style: GoogleFonts.poppins(),
              ),
              SizedBox(height: screenHeight * 0.04),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Submit action
                  },
                  child: Text(
                    'Submit',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFFED4226),
                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildProblemChips(List<String> labels) {
    return labels.map((label) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedProblem = label;
          });
        },
        child: Chip(
          label: Text(
            label,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: selectedProblem == label ? Colors.white : Colors.black,
              ),
            ),
          ),
          backgroundColor: selectedProblem == label ? Color(0xFFED4226) : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      );
    }).toList();
  }
}
