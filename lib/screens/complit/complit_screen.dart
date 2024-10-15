import 'package:flutter/material.dart';
import 'package:ui_ecommerce/screens/complit/component/body.dart';

class ComplitScreen extends StatelessWidget {
  static String routesName = '/complit';
  const ComplitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complete Profile"),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}