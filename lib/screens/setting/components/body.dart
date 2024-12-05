import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/screens/setting/components/setting_assets.dart';
import 'package:ui_ecommerce/sized_config.dart';
import 'package:ui_ecommerce/state_management/theme_provider.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SettingAsset(),
          SizedBox(height: getPropScreenWidth(20)),
          Consumer<ThemeProvider>(
            builder: (context, theme, child) => ItemButtonServices(
              icon: Icon(
                theme.isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
                color: Theme.of(context).iconTheme.color,
              ),
              title: "Dark Mode",
              press: () {
                theme.toggleTheme(!theme.isDarkMode);
              },
            ),
          ),
          ItemButtonServices(
            icon: Icon(Icons.design_services),
            title: "UI settings",
            press: () {},
          ),
          ItemButtonServices(
            icon: Icon(Icons.language),
            title: "Language",
            press: () {},
          ),
          ItemButtonServices(
            icon: Icon(Icons.wallpaper),
            title: "Wallpaper",
            press: () {},
          ),
        ],
      ),
    );
  }
}
