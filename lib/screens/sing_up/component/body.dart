import 'package:flutter/material.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/screens/sing_up/component/sing_up_form.dart';
import 'package:ui_ecommerce/sized_config.dart';
import 'package:ui_ecommerce/sosmed_icon.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Register Account"  , style: headingStyle),
              SizedBox(height: SizedConfig.screenHeight * 0.02),
              Text("Complete your detail or continue \nwith sosial media", textAlign: TextAlign.center,),
              SizedBox(height: SizedConfig.screenHeight * 0.06),
              signUpForm(),
              SizedBox(height: SizedConfig.screenHeight * 0.06),
              Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SosMed(press: () {},  icon: "assets/icons/google-icon.svg"),
                      SosMed(press: () {},  icon: "assets/icons/twitter.svg",),
                      SosMed(press: () {},  icon: "assets/icons/facebook-2.svg"),
                    ],
              ),
              SizedBox(height: SizedConfig.screenHeight * 0.03),
              Text("By Continuing your confim with your agree \nwith our trem and condition",  textAlign: TextAlign.center,)
            ],
          ),
        ),
      )
      );
  }
}


