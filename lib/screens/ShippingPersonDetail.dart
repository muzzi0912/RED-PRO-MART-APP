import 'package:flutter/material.dart';
import 'package:redpro_mart/screens/profileScreen.dart';
import 'package:redpro_mart/screens/searchScreen.dart';
import 'package:redpro_mart/screens/wishlistScreen.dart';

import '../Widgets/bottomNavBar.dart';
import '../utils/constants.dart';
import 'CartScreen.dart';
import 'HomeScreen.dart';

class ShippingDetailPerson extends StatefulWidget {
  @override
  _ShippingDetailPersonState createState() => _ShippingDetailPersonState();
}

class _ShippingDetailPersonState extends State<ShippingDetailPerson> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _address = '';
  String _city = '';
  String _state = '';
  String _country = '';
  String _zipCode = '';
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
    WishlistScreen(),
    ProfileScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => _widgetOptions[index],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(),
              ),
            );
          },
          child: Image.asset(
            'assets/backButton.png', // Replace with your back button image path
            height: 30,
            width: 30,
          ),
        ),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.check,color: Colors.black,))],

        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Text(
                'Shipping Information',
                style: TextStyle(color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                enableInteractiveSelection: false,
                keyboardType: TextInputType.text,
                cursorColor: Constants.mainAppColor,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color:Colors.grey),
                  labelText: 'City Dropdown',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your city';
                  }
                  return null;
                },
                onSaved: (value) {
                  _city = value!;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                enableInteractiveSelection: false,
                keyboardType: TextInputType.text,
                cursorColor: Constants.mainAppColor,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.grey),
                  labelText: 'Shipping Address',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
                onSaved: (value) {
                  _address = value!;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                enableInteractiveSelection: false,
                keyboardType: TextInputType.text,
                cursorColor: Constants.mainAppColor,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.grey),
                  labelText: 'Shipping State',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your state';
                  }
                  return null;
                },
                onSaved: (value) {
                  _state = value!;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                enableInteractiveSelection: false,
                keyboardType: TextInputType.text,
                cursorColor: Constants.mainAppColor,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.grey),
                  labelText: 'Country',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your country';
                  }
                  return null;
                },
                onSaved: (value) {
                  _country = value!;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                enableInteractiveSelection: false,
                keyboardType: TextInputType.number,
                cursorColor: Constants.mainAppColor,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.grey),
                  labelText: 'Postal Code',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your postal code';
                  }
                  return null;
                },
                onSaved: (value) {
                  _zipCode = value!;
                },
              ),
              SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: () {
              //     if (_formKey.currentState!.validate()) {
              //       _formKey.currentState!.save();
              //       // Process the data here
              //       print('City: $_city');
              //       print('Address: $_address');
              //       print('State: $_state');
              //       print('Country: $_country');
              //       print('Postal Code: $_zipCode');
              //     }
              //   },
              //   child: Text('Submit'),
              // ),
            ],
          ),
        ),
      ),bottomNavigationBar: PersistentBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
