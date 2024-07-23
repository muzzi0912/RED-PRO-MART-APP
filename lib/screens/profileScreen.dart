import 'package:flutter/material.dart';
import 'package:redpro_mart/screens/About.dart';
import 'package:redpro_mart/screens/HelpCenterScreen.dart';
import 'package:redpro_mart/screens/NotificationScreen.dart';
import 'package:redpro_mart/screens/ReturnAndRefundPolicy.dart';
import 'package:redpro_mart/screens/ShippingPolicy.dart';
import 'package:redpro_mart/screens/TermsAndConditions.dart';
import 'package:redpro_mart/screens/filterScreen.dart';
import 'package:redpro_mart/screens/searchScreen.dart';
import 'package:redpro_mart/screens/wishlistScreen.dart';
import '../Widgets/bottomNavBar.dart';
import '../utils/constants.dart';
import 'CartScreen.dart';
import 'HelpScreen.dart';
import 'HomeScreen.dart';
import 'ProblemReportScreen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 0; // Set initial selected index for the Cart screen
  int _orderStatusIndex = 0; // Index for order status tabs

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
    // Navigate to the selected screen in the persistent bottom navigation
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => _widgetOptions[index],
      ),
    );
  }

  void _onOrderStatusTapped(int index) {
    setState(() {
      _orderStatusIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              // Settings action
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.red[900]),
              accountName: Text("John Doe"),
              accountEmail: null,
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "J",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            _createDrawerItem(
              icon: Icons.person,
              text: 'My Profile',
              onTap: () {
                // Navigate to profile screen
                Navigator.pop(context); // Close the drawer
              },
            ),
            _createDrawerItem(
              icon: Icons.rule,
              text: 'Terms & Condition',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Termsandconditions(),
                  ),
                ); // Close the drawer
              },
            ),
            _createDrawerItem(
              icon: Icons.chat,
              text: 'Chat Support',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatSupport(),
                  ),
                );
              },
            ),
            _createDrawerItem(
              icon: Icons.help,
              text: 'Help',
              onTap: () {
                // Navigate to help screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HelpCenterScreen(),
                  ),
                ); // Close the drawer
              },
            ),
            _createDrawerItem(
              icon: Icons.local_shipping,
              text: 'Shipping Policy',
              onTap: () {
                // Navigate to shipping policy screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShippingPolicy(),
                  ),
                ); // Close the drawer
              },
            ),
            _createDrawerItem(
              icon: Icons.verified_user,
              text: 'Return & Refund Policy',
              onTap: () {
                // Navigate to return & refund policy screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Returnandrefundpolicy(),
                  ),
                ); // Close the drawer
              },
            ),
            _createDrawerItem(
              icon: Icons.info,
              text: 'Our Story',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutScreen(),
                  ),
                );
              },
            ),
            _createDrawerItem(
              icon: Icons.notifications,
              text: 'Notification',
              onTap: () {
                // Navigate to notification screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationScreen(),
                  ),
                ); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text('LOGOUT', style: TextStyle(color: Colors.red)),
              onTap: () {
                // Log out action
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.2,
              width: screenWidth,
              color: Colors.red[900],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/images/profile_picture.png'), // Your profile image path
                        ),
                        SizedBox(width: 16),
                        Text(
                          'John Doe',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              '0',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'My Wishlist',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '0',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'My Orders',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Orders',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _createOrderStatusButton('Active', Icons.check_box, 0),
                      _createOrderStatusButton('Completed', Icons.check_circle_outline, 1),
                      _createOrderStatusButton('Cancel', Icons.cancel, 2),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _createManualRoute('My Returns', Icons.assignment_return, () {
                        // Navigate to My Returns screen
                      }),
                      Container(
                        height: 1,
                        width: screenWidth * 0.09,
                        color: Colors.grey,
                      ),
                      _createManualRoute('Cancellation', Icons.cancel, () {
                        // Navigate to Cancellation screen
                      }),
                    ],
                  ),
                  SizedBox(height: 10),
                  _createOrderList(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: PersistentBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget _createDrawerItem({required IconData icon, required String text, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: onTap,
    );
  }

  Widget _createOrderStatusButton(String title, IconData icon, int index) {
    return GestureDetector(
      onTap: () => _onOrderStatusTapped(index),
      child: Column(
        children: [
          Icon(
            icon,
            color: _orderStatusIndex == index ? Colors.red : Colors.grey,
          ),
          Text(
            title,
            style: TextStyle(
              color: _orderStatusIndex == index ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }


  Widget _createManualRoute(String title, IconData icon, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
          onTap: onTap,
        child: Row(
        children: [
        Icon(
        icon,
        color: Colors.red,
      ),
      SizedBox(width: 5),
      Text(
      title,
      style: TextStyle(
      color: Colors.red,
      ),
      ),
      ],
      ),
      ),
    );
  }

  Widget _createOrderList() {
    // This widget will display a list of orders. Replace with actual data.
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 6, // Example item count
      itemBuilder: (context, index) {
        return Card(color: Colors.white,
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/ApplesBanner.png'), // Your order image path
            ),
            title: Text('Red Gala Apples'),
            subtitle: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('US  Fancy'),
                SizedBox(width: 50,),
                Text('04-09-2024')


              ],
            ),
            trailing: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Constants.mainAppColor, // Text color
                side: BorderSide(color: Constants.mainAppColor, width: 10), // Border color and width
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Border radius
                ),
              ),
              onPressed: () {
                // View Order button action
              },
              child: Text('View Order'),
            ),
          ),
        );
      },
    );
  }
}
