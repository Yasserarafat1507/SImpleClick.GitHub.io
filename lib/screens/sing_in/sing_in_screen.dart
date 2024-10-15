import 'package:flutter/material.dart';
import 'package:ui_ecommerce/screens/sing_in/components/body.dart';

class SingInScreen extends StatelessWidget {
  static String routesName = "/sing_in";
  const SingInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sing In"),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}