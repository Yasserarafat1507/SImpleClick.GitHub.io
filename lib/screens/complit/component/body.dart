import 'package:flutter/material.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/screens/complit/component/complit_profile_form.dart';
import 'package:ui_ecommerce/sized_config.dart';

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
              Text("Complete Profile"  , style: headingStyle),
              SizedBox(height: SizedConfig.screenHeight * 0.03),
              Text("Complete your profile Data", textAlign: TextAlign.center,),
              SizedBox(height: SizedConfig.screenHeight * 0.06),
              completeForm(),
              SizedBox(height: SizedConfig.screenHeight * 0.03),
              Text("By Continuing your confim with your agree \nwith our trem and condition",  textAlign: TextAlign.center,)
            ],
          ),
        ),
      ),
      );
  }
}

