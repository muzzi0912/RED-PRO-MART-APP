import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Widgets/bottomNavBar.dart';
import '../utils/constants.dart';
import 'About.dart';
import 'CartScreen.dart';
import 'HelpCenterScreen.dart';
import 'HelpScreen.dart';
import 'HomeScreen.dart';
import 'ProblemReportScreen.dart';
import 'ShippingPolicy.dart';
import 'TermsAndConditions.dart';
import 'filterScreen.dart';
import 'searchScreen.dart';
import 'wishlistScreen.dart';
import 'EditProfileScreen.dart'; // Add this import for the Edit Profile screen
import 'NotificationScreen.dart'; // Add this import for the Notification screen
import 'Returnandrefundpolicy.dart'; // Add this import for the Return and Refund Policy screen

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  int _orderStatusIndex = 0;

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
  void _showProfileOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Modify Profile'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditProfileScreen(),
                  ),
                );
              },
              child: Text('Edit Profile'),
            ),
            // Add more options if needed
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
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
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfileScreen(), // Link to Edit Profile Screen
                ),
              );
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
              accountName: Text("John Doe", style: GoogleFonts.poppins(color: Colors.white)),
              accountEmail: null,
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "J",
                  style: GoogleFonts.poppins(fontSize: 40.0),
                ),
              ),
            ),
            _createDrawerItem(
              imagePath: 'assets/Profile1.png',
              text: 'My Profile',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            _createDrawerItem(
              imagePath: 'assets/TermCond.png',
              text: 'Terms & Conditions',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Termsandconditions(),
                  ),
                );
              },
            ),
            _createDrawerItem(
              imagePath: 'assets/chatSupport.png',
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
              imagePath: 'assets/Help.png',
              text: 'Help',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HelpCenterScreen(),
                  ),
                );
              },
            ),
            _createDrawerItem(
              imagePath: 'assets/ShippingPolicy.png',
              text: 'Shipping Policy',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShippingPolicy(),
                  ),
                );
              },
            ),
            _createDrawerItem(
              imagePath: 'assets/Return.png',
              text: 'Return & Refund Policy',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Returnandrefundpolicy(),
                  ),
                );
              },
            ),
            _createDrawerItem(
              imagePath: 'assets/chatSupport.png',
              text: 'Filter',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FilterScreen(),
                  ),
                );
              },
            ), _createDrawerItem(
              imagePath: 'assets/Help.png',
              text: 'Problem',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProblemReportScreen(),
                  ),
                );
              },
            ),
            _createDrawerItem(
              imagePath: 'assets/OutStory.png',
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
              imagePath: 'assets/notification.png',
              text: 'Notifications',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: IconButton(onPressed: () {}, icon: Icon(Icons.logout, color: Colors.red)),
              title: Text('Logout', style: GoogleFonts.poppins(color: Colors.red)),
              onTap: () {
                Navigator.pop(context);
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
                           backgroundImage: AssetImage('assets/ceo_image.png'),
                        ),
                        SizedBox(width: 16),
                        Text(
                          'John Doe',
                          style: GoogleFonts.poppins(color: Colors.white, fontSize: 18),
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
                              '6',
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                            Text(
                              'My Wishlist',
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '10',
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                            Text(
                              'My Orders',
                              style: GoogleFonts.poppins(color: Colors.white),
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
                    style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _createOrderStatusButton('Active', 'assets/Active.png', 0),
                      _createOrderStatusButton('Completed', 'assets/Cmp.png', 1),
                      _createOrderStatusButton('Cancel', 'assets/Cancel.png', 2),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _createManualRoute('My Returns', 'assets/MyReturns.png', () {
                          // Navigate to My Returns screen
                        }),
                        Container(
                          height: 1,
                          width: screenWidth * 0.09,
                          color: Colors.grey,
                        ),
                        _createManualRoute('Cancellation', 'assets/My Cancellation.png', () {
                          // Navigate to Cancellation screen
                        }),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Divider(thickness: 1),
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

  Widget _createDrawerItem({required String imagePath, required String text, required VoidCallback onTap}) {
    return ListTile(
      leading: Image.asset(imagePath, width: 24, height: 24,color: Constants.mainAppColor,),
      title: Text(text, style: GoogleFonts.poppins(color: Colors.black)),
      onTap: onTap,
    );
  }

  Widget _createOrderStatusButton(String label, String imagePath, int index) {
    return GestureDetector(
      onTap: () => _onOrderStatusTapped(index),
      child: Column(
        children: [
          Image.asset(imagePath, height: 30),
          Text(
            label,
            style: GoogleFonts.poppins(fontSize: 16, color: _orderStatusIndex == index ? Colors.red : Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _createManualRoute(String label, String imagePath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(imagePath, height: 50),
          SizedBox(height: 5),
          Text(label, style: GoogleFonts.poppins(fontSize: 16)),
        ],
      ),
    );
  }

  Widget _createOrderList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 6,
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage('assets/ApplesBanner.png'),
          ),
          title: Text('Red Gala Apples', style: GoogleFonts.poppins()),
          subtitle: Row(
            children: [
              Text('US Fancy', style: GoogleFonts.poppins()),
              SizedBox(width: 8),
              Text('04-09-2024', style: GoogleFonts.poppins()),
            ],
          ),
          trailing: SizedBox(
            width: 90,
            height: 40,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Constants.mainAppColor, // Button color
                side: BorderSide(color: Constants.mainAppColor, width: 2), // Border color and width
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Border radius
                ),
                padding: EdgeInsets.symmetric(vertical: 0.0), // Reduced vertical padding for height
              ),
              onPressed: () {
                // View Order button action
              },
              child: Center(
                child: Text(
                  'View Order',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 12, // Adjust font size if needed
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

}
