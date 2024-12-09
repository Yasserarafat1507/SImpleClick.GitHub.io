import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_ecommerce/routes.dart';
import 'package:ui_ecommerce/screens/home/home.dart';
import 'package:ui_ecommerce/screens/splach/splash_screen.dart';
import 'package:ui_ecommerce/state_management/auth_provider.dart';
import 'package:ui_ecommerce/state_management/cart_provider.dart';
import 'package:ui_ecommerce/state_management/favorite_provider.dart';
import 'package:ui_ecommerce/theme.dart';
import 'package:ui_ecommerce/state_management/theme_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool("isLoggedIn") ?? false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoriteProvider(),
        ),
      ],
      child: DevicePreview(
        enabled: false,
        builder: (context) => MainApp(
          isLoggedIn: isLoggedIn,
        ),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.isLoggedIn});

  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, theme, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData(theme.isDarkMode),
        title: 'ClickSimple',
        initialRoute:
            isLoggedIn ? HomeScreen.routesName : SplashScreen.routesName,
        routes: routes,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
      ),
    );
  }
}
