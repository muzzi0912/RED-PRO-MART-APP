import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';
import 'favBtn.dart';

class FeaturedDealDuplicate extends StatefulWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final double rating;
  final double price;

  FeaturedDealDuplicate({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.price,
  });

  @override
  _FeaturedDealDuplicateState createState() => _FeaturedDealDuplicateState();
}

class _FeaturedDealDuplicateState extends State<FeaturedDealDuplicate> {
  bool isFavorite = false;

  void _onFavoriteChanged(bool newValue) {
    setState(() {
      isFavorite = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Stack(
            children: [
              Container(
                height: 130,
                decoration: BoxDecoration(
                  color: Color(0xFFF4F4F4),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  image: DecorationImage(
                    image: AssetImage(widget.imagePath),
                    fit: BoxFit.contain,
                    scale: 0.80,
                  ),
                ),
              ),
              Positioned(
                top: 15,
                left: 15,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.red[700],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    '20% Off',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 15,
                right: 10,
                child: FavoriteButton(
                  isFavorite: isFavorite,
                  iconColor: Colors.red,
                  iconDisabledColor: Colors.grey[400],
                  valueChanged: _onFavoriteChanged,
                ),
              ),
            ],
          ),
          Container(
            color: Color(0xFFF4F4F4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12.0, right: 8.0, top: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Flat 20% Off',
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Constants.mainAppColor,
                        ),
                      ),
                      Text(
                        widget.title,
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.subtitle,
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: List.generate(5, (index) {
                          if (index < widget.rating.floor()) {
                            return Icon(Icons.star, color: Colors.black, size: 16);
                          } else {
                            return Icon(Icons.star_border, color: Colors.black, size: 16);
                          }
                        }),
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5), // Padding for the container
                          decoration: BoxDecoration(
                            color: Color(0xFFED4226),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                          child: Text(
                            '\$${widget.price}/lb',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 10, // Adjust font size as needed
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        // Handle onTap functionality for cart icon
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            // Circular border radius
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/Rectanglebg.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/ShoppingTrolley.png', // Path to your icon image
                            width: 20,
                            height: 20,
                            color: Colors.white, // This will apply a white tint to your icon image
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
