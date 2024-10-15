import 'package:flutter/material.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/screens/otp/component/otp_form.dart';
import 'package:ui_ecommerce/sized_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
        child: Column(
          children: [
            Text("OTP Verification"  , style: headingStyle),
              SizedBox(height: SizedConfig.screenHeight * 0.03),
              Text("We Send your code to +64 8*** ****", textAlign: TextAlign.center,),
              timer(),
              SizedBox(height: SizedConfig.screenHeight * 0.15),
              OtpForm(),
          ],
        ),
      ),
    );
  }

  Row timer() {
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("This code will expired in ", textAlign: TextAlign.center,),
                TweenAnimationBuilder(tween: Tween(begin: 60.0, end: 0), duration: Duration(seconds: 60), builder: (context, value, child) {
                  return Text("00:${value.toInt()}", style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),);
                },
                onEnd: () {},
                )
              ],
            );
  }
}