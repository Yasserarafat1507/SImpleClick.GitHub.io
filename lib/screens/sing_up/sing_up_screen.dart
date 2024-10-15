import 'package:flutter/material.dart';
import 'package:ui_ecommerce/screens/sing_up/component/body.dart';


class SignUpScreen extends StatelessWidget {
  static String routesName = "/sign_up";
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        centerTitle: true,
        ),
      body: Body(),
    );
  }
}