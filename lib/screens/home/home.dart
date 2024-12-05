import 'package:flutter/material.dart';
import 'package:ui_ecommerce/components/costume_navigator.dart';
import 'package:ui_ecommerce/enums.dart';
import 'package:ui_ecommerce/screens/home/component/body.dart';
import 'package:ui_ecommerce/sized_config.dart';

class HomeScreen extends StatelessWidget {
  static String routesName = "/home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizedConfig().init(context);
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CostumeButtonBar(
        menu: MenuState.home,
      ),
    );
  }
}
