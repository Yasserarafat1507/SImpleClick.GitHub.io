import 'package:flutter/material.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/screens/sing_in/components/sing_in_form.dart';
import 'package:ui_ecommerce/screens/sing_up/sing_up_screen.dart';
import 'package:ui_ecommerce/sized_config.dart';
import 'package:ui_ecommerce/sosmed_icon.dart';


class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

  bool remember = false;

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 
            getPropScreenWidth(20)
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: SizedConfig.screenHeight * 0.06,
                ),
                Text("Welcome back", 
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getPropScreenWidth(28),
                  fontWeight: FontWeight.bold
                  ),
                ),
                const Text("Sing In With your Email and Password \nor continue with socsial media",
                textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: SizedConfig.screenHeight * 0.06,
                ),
                SingInForm(),
                SizedBox(
                  height: SizedConfig.screenHeight * 0.06,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SosMed(press: () {},  icon: "assets/icons/google-icon.svg"),
                    SosMed(press: () {},  icon: "assets/icons/twitter.svg",),
                    SosMed(press: () {},  icon: "assets/icons/facebook-2.svg"),
                  ],
                ),
                SizedBox(height: getPropScreenHeight(20),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SignUpScreen.routesName);
                      },
                      child: Text("Sing Up", style:   TextStyle(color: kPrimaryColor),)
                    ),
                  ],
                )
              ]
            ),
          ),
        ),
      )
    );
  }
}


