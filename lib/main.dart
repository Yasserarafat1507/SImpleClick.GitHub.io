import 'package:flutter/material.dart';
import 'package:ui_ecommerce/routes.dart';
import 'package:ui_ecommerce/screens/splach/splash_screen.dart';
import 'package:ui_ecommerce/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData(),
      title: 'ClickSimple',
      initialRoute: SplashScreen.routesName,
      routes: routes,
    );
  }
}
