import 'package:flutter/material.dart';
import 'package:ui_ecommerce/components/costume_navigator.dart'; // CostumeButtonBar
import 'package:ui_ecommerce/enums.dart'; // MenuState enum
import 'components/body.dart'; // Body widget

class ServiceScreen extends StatelessWidget {
  static String routesName = "/services";
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Body(),
      bottomNavigationBar:
          CostumeButtonBar(menu: MenuState.services), // Set Profile active
    );
  }
}

AppBar appBar(BuildContext context) {
  return AppBar(
    leading: Container(),
    centerTitle: true,
    title: Text(
      "Services",
      style: Theme.of(context).textTheme.bodyLarge,
    ),
  );
}
