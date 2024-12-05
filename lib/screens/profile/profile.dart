import 'package:flutter/material.dart';
import 'package:ui_ecommerce/components/costume_navigator.dart'; // CostumeButtonBar
import 'package:ui_ecommerce/enums.dart';
import 'components/body.dart'; // Body widget

class ProfileScreen extends StatelessWidget {
  static String routesName = "/profile";
  final String name;
  const ProfileScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Body(),
      bottomNavigationBar:
          CostumeButtonBar(menu: MenuState.profile), // Set Profile active
    );
  }
}

AppBar appBar(BuildContext context) {
  return AppBar(
    forceMaterialTransparency: true,
    leading: Container(),
    centerTitle: true,
    title: Text(
      "Profile",
      style: Theme.of(context).textTheme.bodyLarge,
    ),
  );
}
