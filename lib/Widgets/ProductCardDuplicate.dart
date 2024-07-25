import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'favBtn.dart';

class ProductCardDuplicate extends StatefulWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final double rating;
  final double price;

  ProductCardDuplicate({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.price,
  });

  @override
  _ProductCardDuplicateState createState() => _ProductCardDuplicateState();
}

class _ProductCardDuplicateState extends State<ProductCardDuplicate> {
  bool isFavorite = false;

  void _onFavoriteChanged(bool newValue) {
    setState(() {
      isFavorite = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.only(bottom: 0), // No margin between the cards
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left edge
        children: [
          Stack(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFFF4F4F4),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  image: DecorationImage(
                    image: AssetImage(widget.imagePath),
                    fit: BoxFit.contain,
                    scale: widget.imagePath.contains('grapes12.png') ? 1.2 : 1.0, // Adjust scale for grapes
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 5,
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
                  padding: const EdgeInsets.all(8.0), // Padding around the title, subtitle, and stars
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
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
                            return Icon(Icons.star, color: Colors.black, size: 14);
                          } else {
                            return Icon(Icons.star_border, color: Colors.black, size: 14);
                          }
                        }),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
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
                          fontSize: 10,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Handle onTap functionality for cart icon
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            child: Container(
                              width: 30,
                              height: 26,
                              color: Color(0xFFEEEEEE),
                              child: Image.asset(
                                'assets/Rectanglebg.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            child: Image.asset(
                              'assets/ShoppingTrolley.png',
                              width: 15,
                              height: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
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
