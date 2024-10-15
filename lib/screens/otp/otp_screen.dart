import 'package:flutter/material.dart';
import 'package:ui_ecommerce/screens/otp/component/body.dart';

class OtpScreen extends StatelessWidget {
  static String routesName = "/otp";
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}