import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redpro_mart/screens/profileScreen.dart';

import '../utils/constants.dart';

class ChatSupport extends StatefulWidget {
  @override
  _ChatSupportState createState() => _ChatSupportState();
}

class _ChatSupportState extends State<ChatSupport> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
        title: Row(
          children: [
            CircleAvatar(backgroundColor: Colors.grey,
               backgroundImage: AssetImage('assets/ceo_image.png'), // Replace with your asset
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Doe',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: width * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),

      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: [
                Row(
                  children: [
                    CircleAvatar(backgroundColor: Colors.grey,
                       backgroundImage: AssetImage('assets/ceo_image.png'), // Replace with your asset
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                          margin: EdgeInsets.only(top: 4),
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Have a great working week!!',
                            style: GoogleFonts.poppins(
                              fontSize: width * 0.035,
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '09:25 AM',
                          style: GoogleFonts.poppins(
                            fontSize: width * 0.03,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          'John Doe',
                          style: GoogleFonts.poppins(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                // User message
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [

                        Container(
                          margin: EdgeInsets.only(top: 4),
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Hello! I need help!',
                            style: GoogleFonts.poppins(
                              fontSize: width * 0.035,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        Text(
                          '09:27 AM',
                          style: GoogleFonts.poppins(
                            fontSize: width * 0.03,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          'You',
                          style: GoogleFonts.poppins(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                      ],
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(backgroundColor: Colors.grey,
                      backgroundImage: AssetImage('assets/ceo_image.png'), // Replace with your asset
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.white,
            child: Row(
              children: [
                Icon(CupertinoIcons.paperplane, color: Colors.grey),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    cursorColor: Constants.mainAppColor,
                    decoration: InputDecoration(
                      hintText: 'Write your message',
                      hintStyle: GoogleFonts.poppins(
                        fontSize: width * 0.04,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Icon(CupertinoIcons.photo, color: Colors.grey),


              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
