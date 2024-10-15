import 'package:flutter/material.dart';
import 'package:ui_ecommerce/screens/forgot/component/body.dart';


class ForgotScreen extends StatelessWidget {
  static String routesName = '/forgot_pw';
  const ForgotScreen({super.key});
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}