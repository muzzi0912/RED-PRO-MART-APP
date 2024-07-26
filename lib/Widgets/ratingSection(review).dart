import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RatingSection extends StatefulWidget {
  @override
  _RatingSectionState createState() => _RatingSectionState();
}

class _RatingSectionState extends State<RatingSection> {
  int _rating = 0; // Default rating value

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Your Overall Rating',
          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return IconButton(
              icon: Icon(
                _rating > index ? Icons.star : Icons.star_border,
                color: Colors.orange,
                size: MediaQuery.of(context).size.width * 0.09,
              ),
              onPressed: () {
                setState(() {
                  _rating = index + 1; // Update rating value
                });
              },
            );
          }),
        ),
      ],
    );
  }
}
