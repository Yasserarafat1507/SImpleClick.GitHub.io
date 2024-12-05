import 'package:flutter/material.dart';
import 'package:ui_ecommerce/model/product_data.dart';
import 'package:ui_ecommerce/screens/carts/carts_screen.dart';
import 'package:ui_ecommerce/screens/complit/complit_screen.dart';
import 'package:ui_ecommerce/screens/details/detail_screen.dart';
import 'package:ui_ecommerce/screens/favorite/favorite_screen.dart';
import 'package:ui_ecommerce/screens/forgot/forgot_screen.dart';
import 'package:ui_ecommerce/screens/home/home.dart';
import 'package:ui_ecommerce/screens/login_succses/succses_screen.dart';
import 'package:ui_ecommerce/screens/otp/otp_screen.dart';
import 'package:ui_ecommerce/screens/profile/profile.dart';
import 'package:ui_ecommerce/screens/services/service_screen.dart';
import 'package:ui_ecommerce/screens/setting/setting.dart';
import 'package:ui_ecommerce/screens/sing_in/sing_in_screen.dart';
import 'package:ui_ecommerce/screens/sing_up/sing_up_screen.dart';
import 'package:ui_ecommerce/screens/splach/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routesName: (context) => SplashScreen(),
  SingInScreen.routesName: (context) => SingInScreen(),
  ForgotScreen.routesName: (context) => ForgotScreen(),
  SuccsesScreen.routesName: (context) => SuccsesScreen(),
  SignUpScreen.routesName: (context) => SignUpScreen(),
  ComplitScreen.routesName: (context) => ComplitScreen(),
  OtpScreen.routesName: (context) => OtpScreen(),
  HomeScreen.routesName: (context) => HomeScreen(),
  DetailScreen.routesName: (context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    return DetailScreen(product: product);
  },
  ProfileScreen.routesName: (context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final name = arguments != null && arguments["name"] != null
        ? arguments["name"] as String
        : "Guest"; // Gunakan nilai default "Guest" jika tidak ada argumen
    return ProfileScreen(name: name);
  },
  CartsScreen.routesName: (context) => CartsScreen(),
  FavouriteScreen.routesName: (context) => FavouriteScreen(),
  ServiceScreen.routesName: (context) => ServiceScreen(),
  SettingScreen.routesName: (context) => SettingScreen(),
};
