import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/screens/favorite/favorite_screen.dart';
import 'package:ui_ecommerce/screens/home/home.dart';
import 'package:ui_ecommerce/screens/profile/profile.dart';
import 'package:ui_ecommerce/enums.dart';
import 'package:ui_ecommerce/screens/services/service_screen.dart';
import 'package:ui_ecommerce/screens/setting/setting.dart';
import 'package:ui_ecommerce/state_management/theme_provider.dart'; // Tambahkan jika belum ada

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
    final themeProvider = Provider.of<ThemeProvider>(context);
    return CurvedNavigationBar(
      color: themeProvider.isDarkMode
          ? const Color.fromARGB(255, 24, 36, 46)
          : const Color.fromARGB(255, 180, 179, 179),
      buttonBackgroundColor: themeProvider.isDarkMode
          ? const Color.fromARGB(255, 24, 36, 46)
          : const Color.fromARGB(255, 215, 213, 213),
      backgroundColor: Colors.transparent,
      index: _currentIndex,
      items: [
        _buildIcon(Icons.settings, 0, SettingScreen.routesName),
        _buildIcon(Icons.home_repair_service, 1, ServiceScreen.routesName),
        _buildIcon(Icons.home, 2, HomeScreen.routesName),
        _buildIcon(Icons.favorite, 3, FavouriteScreen.routesName),
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
          } else if (index == 3) {
            Navigator.pushNamed(context, FavouriteScreen.routesName).then((_) {
              setState(() {
                _currentIndex =
                    _getMenuIndex(MenuState.home); // Kembali ke home
              });
            });
          } else if (index == 1) {
            Navigator.pushNamed(context, ServiceScreen.routesName).then((_) {
              setState(() {
                _currentIndex =
                    _getMenuIndex(MenuState.home); // Kembali ke home
              });
            });
          } else if (index == 0) {
            Navigator.pushNamed(context, SettingScreen.routesName).then((_) {
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
        color: _currentIndex == index ? kPrimaryColor : Colors.white,
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
      case MenuState.services:
        return 1;
      case MenuState.settings:
        return 0;
      default:
        return 2;
    }
  }
}
