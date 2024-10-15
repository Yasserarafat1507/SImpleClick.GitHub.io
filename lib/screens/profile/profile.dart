import 'package:flutter/material.dart';
import 'package:ui_ecommerce/components/costume_navigator.dart'; // CostumeButtonBar
import 'package:ui_ecommerce/enums.dart'; // MenuState enum
import 'components/body.dart'; // Body widget

class ProfileScreen extends StatelessWidget {
  static String routesName = "/profile";
  const ProfileScreen({super.key});

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
    leading: IconButton(
      onPressed: () {
        // Kembali ke HomeScreen secara eksplisit saat menekan tombol back
        Navigator.pushReplacementNamed(context, '/home');
      },
      icon: Icon(Icons.arrow_back_ios),
    ),
    title: Text("Your Profile", style: Theme.of(context).textTheme.bodyLarge),
  );
}
