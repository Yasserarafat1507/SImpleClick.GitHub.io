import 'package:flutter/material.dart';
import 'package:ui_ecommerce/screens/login_succses/component/body.dart';

class SuccsesScreen extends StatelessWidget {
  static String routesName = '/login_succses';
  const SuccsesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Login Success'),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}