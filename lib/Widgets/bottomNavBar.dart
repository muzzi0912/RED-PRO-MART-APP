import 'package:flutter/material.dart';
import 'package:redpro_mart/screens/searchScreen.dart';
import 'package:redpro_mart/screens/wishlistScreen.dart';

import '../screens/CartScreen.dart';
import '../screens/HomeScreen.dart';
import '../screens/profileScreen.dart';

class PersistentBottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  PersistentBottomNavBar({required this.selectedIndex, required this.onItemTapped});

  @override
  _PersistentBottomNavBarState createState() => _PersistentBottomNavBarState();
}

class _PersistentBottomNavBarState extends State<PersistentBottomNavBar> {
  List<String> _imagePaths = [
    'assets/Home.png',
    'assets/Search.png',
    'assets/ShoppingTrolley.png',
    'assets/favorite.png',
    'assets/Profile.png',
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      currentIndex: widget.selectedIndex.clamp(0, _imagePaths.length - 1),
      onTap: (index) {
        if (index >= 0 && index < _imagePaths.length) {
          widget.onItemTapped(index);
          _navigateToScreen(index, context);
        }
      },
      items: List.generate(_imagePaths.length, (index) {
        return BottomNavigationBarItem(
          icon: InkWell(
            onTap: () {
              if (index >= 0 && index < _imagePaths.length) {
                widget.onItemTapped(index);
                _navigateToScreen(index, context);
              }
            },
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            child: IconWidget(
              path: _imagePaths[index],
              isSelected: widget.selectedIndex == index,
            ),
          ),
          label: '',
        );
      }),
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }

  void _navigateToScreen(int index, BuildContext context) {
    Widget newScreen;
    switch (index) {
      case 0:
        newScreen = HomeScreen();
        break;
      case 1:
        newScreen = SearchScreen();
        break;
      case 2:
        newScreen = CartScreen();
        break;
      case 3:
        newScreen = WishlistScreen();
        break;
      case 4:
        newScreen = ProfileScreen();
        break;
      default:
        newScreen = HomeScreen();
    }

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => newScreen,
        transitionDuration: Duration.zero,
      ),
    );
  }
}

class IconWidget extends StatelessWidget {
  final String path;
  final bool isSelected;

  const IconWidget({required this.path, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        isSelected ? Colors.deepOrange : Colors.grey,
        BlendMode.srcIn,
      ),
      child: Image.asset(
        path,
        width: 24,
        height: 24,
      ),
    );
  }
}
