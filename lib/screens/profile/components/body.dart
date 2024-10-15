import 'package:flutter/material.dart';
import 'package:ui_ecommerce/screens/profile/components/profile_assets.dart';
import 'package:ui_ecommerce/screens/sing_in/sing_in_screen.dart';
import 'package:ui_ecommerce/sized_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfilePicture(),
          SizedBox(height: getPropScreenWidth(20)),
          ItemButtonProfile(
            svgIcon: "assets/icons/User Icon.svg",
            title: "My Account",
            press: () {},
          ),
          ItemButtonProfile(
            svgIcon: "assets/icons/Bell.svg",
            title: "Notivication",
            press: () {},
          ),
          ItemButtonProfile(
            svgIcon: "assets/icons/Settings.svg",
            title: "Settings",
            press: () {},
          ),
          ItemButtonProfile(
            svgIcon: "assets/icons/Question mark.svg",
            title: "Help Center",
            press: () {},
          ),
          ItemButtonProfile(
            svgIcon: "assets/icons/Log out.svg",
            title: "Log out",
            press: () {
              Navigator.pushNamedAndRemoveUntil(context,
                  SingInScreen.routesName, (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
}
