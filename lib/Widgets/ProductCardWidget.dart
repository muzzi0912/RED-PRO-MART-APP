import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final double rating;
  final double price;

  ProductCard({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.price,
  });

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
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
                height: 120,
                decoration: BoxDecoration(
                  color: Color(0xFFF4F4F4),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  image: DecorationImage(
                    image: AssetImage(widget.imagePath),
                    fit: BoxFit.contain,
                    scale: widget.imagePath.contains('grapes12.png') ? 0.8 : 1.0, // Adjust scale for grapes
                  ),
                ),
              ),
              Positioned(
                top: 15,
                right: 10,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          Container(
            color: Color(0xFFF4F4F4),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.subtitle,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
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
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
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
                              fontSize: 12, // Adjust font size as needed
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 150),
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
                              width: 40,
                              height: 40,
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
