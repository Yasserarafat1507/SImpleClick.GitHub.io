import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/screens/profile/components/profile_assets.dart';
import 'package:ui_ecommerce/screens/sing_in/sing_in_screen.dart';
import 'package:ui_ecommerce/sized_config.dart';
import 'package:ui_ecommerce/state_management/auth_provider.dart';

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  get name => null;

  @override
  Widget build(BuildContext context) {
    final email = Provider.of<AuthProvider>(context).email;
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfilePicture(),
          SizedBox(height: getPropScreenWidth(20)),
          Text(
            "Wellcome ${email ?? "Guest"}!",
            style: TextStyle(
                fontSize: getPropScreenWidth(16), fontWeight: FontWeight.bold),
          ),
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
            svgIcon: "assets/icons/Question mark.svg",
            title: "Help Center",
            press: () {},
          ),
          ItemButtonProfile(
            svgIcon: "assets/icons/Log out.svg",
            title: "Log out",
            press: () {
              Provider.of<AuthProvider>(context, listen: false).setAuth(false);
              Navigator.pushNamedAndRemoveUntil(context,
                  SingInScreen.routesName, (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
}
