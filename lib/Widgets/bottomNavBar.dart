import 'package:flutter/material.dart';

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
      backgroundColor: Colors.white,
      currentIndex: widget.selectedIndex,
      onTap: widget.onItemTapped,
      items: List.generate(_imagePaths.length, (index) {
        return BottomNavigationBarItem(
          icon: IconWidget(
            path: _imagePaths[index],
            isSelected: widget.selectedIndex == index,
          ),
          label: '',
        );
      }),
      showSelectedLabels: false,
      showUnselectedLabels: false,
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
