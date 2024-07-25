import 'package:flutter/material.dart';

import '../utils/constants.dart';

class FilterDialog extends StatefulWidget {
  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  String _selectedCategory = 'All';
  String _selectedPricing = 'Asc';
  String _selectedMostPurchased = 'None';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Filter Products'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Category Filter
          DropdownButton<String>(
            value: _selectedCategory,
            items: <String>['All', 'Electronics', 'Clothing', 'Groceries']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedCategory = newValue!;
              });
            },
            isExpanded: true,
            hint: Text('Select Category'),
          ),
          SizedBox(height: 16),
          // Pricing Filter
          DropdownButton<String>(
            value: _selectedPricing,
            items: <String>['Asc', 'Desc']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text('Price $value'),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedPricing = newValue!;
              });
            },
            isExpanded: true,
            hint: Text('Select Pricing Order'),
          ),
          SizedBox(height: 16),
          // Most Purchased Filter
          DropdownButton<String>(
            value: _selectedMostPurchased,
            items: <String>['None', 'Top 10', 'Top 20']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedMostPurchased = newValue!;
              });
            },
            isExpanded: true,
            hint: Text('Most Purchased'),
          ),
        ],
      ),
      actions: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              child: Text('Apply',style: TextStyle(color: Constants.buttonColor),),
              onPressed: () {
                // Implement your filtering logic here
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Cancel',style: TextStyle(color: Constants.buttonColor),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),

      ],
    );
  }
}
