import 'package:flutter/material.dart';
import 'package:ui_ecommerce/components/costume_navigator.dart'; // CostumeButtonBar
import 'package:ui_ecommerce/enums.dart';
import 'components/body.dart'; // Body widget

class SettingScreen extends StatelessWidget {
  static String routesName = "/setting";
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Body(),
      bottomNavigationBar:
          CostumeButtonBar(menu: MenuState.settings), // Set Profile active
    );
  }
}

AppBar appBar(BuildContext context) {
  return AppBar(
    leading: Container(),
    centerTitle: true,
    title: Text(
      "Setting",
      style: Theme.of(context).textTheme.bodyLarge,
    ),
  );
}
