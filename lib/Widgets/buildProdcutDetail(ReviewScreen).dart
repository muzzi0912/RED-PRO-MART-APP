import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildProductDetails(BuildContext context) {
  return Row(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          'assets/banana.png',
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.height * 0.1,
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(width: MediaQuery.of(context).size.width * 0.04),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fresh and Juicy Papaya',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.035,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Row(
              children: [
                Icon(Icons.star,
                    color: Colors.orange,
                    size: MediaQuery.of(context).size.width * 0.04),
                Icon(Icons.star,
                    color: Colors.orange,
                    size: MediaQuery.of(context).size.width * 0.04),
                Icon(Icons.star,
                    color: Colors.orange,
                    size: MediaQuery.of(context).size.width * 0.04),
                Icon(Icons.star,
                    color: Colors.orange,
                    size: MediaQuery.of(context).size.width * 0.04),
                Icon(Icons.star_border,
                    color: Colors.orange,
                    size: MediaQuery.of(context).size.width * 0.04),
                SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                Text(
                  '(04)',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: MediaQuery.of(context).size.width * 0.03,
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(
              '\$40.00',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.045,
                color: Color(0xffe34126),
              ),
            ),
          ],
        ),
      ),
      ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xffe34126),
          padding: EdgeInsets.symmetric(vertical: 9, horizontal: 19),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text('Re-Order', style: TextStyle(color: Colors.white)),
      ),
    ],
  );
}