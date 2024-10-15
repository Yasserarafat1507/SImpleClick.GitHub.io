import 'package:flutter/material.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/screens/forgot/component/forgot_pw_form.dart';
import 'package:ui_ecommerce/sized_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: SizedConfig.screenHeight * 0.04,
            ),
            Text("Forgot Password", style: TextStyle(
              fontSize: getPropScreenHeight(28),
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            ),
            Text("Please enter your email an we will send \nyou a link to rentren to your account", textAlign:TextAlign.center,),
            SizedBox(
              height: SizedConfig.screenHeight * 0.06,
            ),
            ForgotPwForm(),
            SizedBox(height: SizedConfig.screenHeight * 0.06,),
            dontHaveAccount()
          ],
        ),
      ),
    );
  }

  Row dontHaveAccount() {
    return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, SignUpScreen.routesName);
                    },
                    child: Text("Sing Up", style:   TextStyle(color: kPrimaryColor),)
                  ),
                ],
              );
  }
}
