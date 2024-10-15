import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/screens/home/home.dart';
import 'package:ui_ecommerce/screens/profile/profile.dart';
import 'package:ui_ecommerce/enums.dart'; // Tambahkan jika belum ada

class CostumeButtonBar extends StatefulWidget {
  const CostumeButtonBar({super.key, required this.menu});

  final MenuState menu;

  @override
  _CostumeButtonBarState createState() => _CostumeButtonBarState();
}

class _CostumeButtonBarState extends State<CostumeButtonBar> {
  int _currentIndex = 2; // Default HomeScreen

  @override
  void initState() {
    super.initState();
    // Set the initial index based on the passed menu state
    _currentIndex = _getMenuIndex(widget.menu);
  }

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      index: _currentIndex,
      items: [
        _buildIcon(Icons.settings, 0, null),
        _buildIcon(Icons.chat_bubble, 1, null),
        _buildIcon(Icons.home, 2, HomeScreen.routesName),
        _buildIcon(Icons.favorite, 3, null),
        _buildIcon(Icons.person_outline, 4, ProfileScreen.routesName),
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  Widget _buildIcon(IconData icon, int index, String? routeName) {
    return IconButton(
      onPressed: () {
        setState(() {
          _currentIndex = index;
        });
        if (routeName != null) {
          if (index == 4) {
            Navigator.pushNamed(context, ProfileScreen.routesName).then((_) {
              setState(() {
                _currentIndex =
                    _getMenuIndex(MenuState.home); // Kembali ke home
              });
            });
          } else {
            Navigator.pushReplacementNamed(context, routeName);
          }
        }
      },
      icon: Icon(
        icon,
        size: 30,
        color: _currentIndex == index ? kPrimaryColor : kSecoundaryColor,
      ),
    );
  }

  // Map MenuState to the corresponding index
  int _getMenuIndex(MenuState menu) {
    switch (menu) {
      case MenuState.home:
        return 2;
      case MenuState.profile:
        return 4;
      case MenuState.favorite:
        return 3;
      case MenuState.message:
        return 1;
      case MenuState.settings:
        return 0;
      default:
        return 2;
    }
  }
}
