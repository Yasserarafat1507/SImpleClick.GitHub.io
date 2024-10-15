import 'package:flutter/material.dart';
import 'package:ui_ecommerce/components/my_button.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/model/splash_data.dart';
import 'package:ui_ecommerce/screens/sing_in/sing_in_screen.dart';
import 'package:ui_ecommerce/screens/splach/components/splash_content.dart';
import 'package:ui_ecommerce/sized_config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  int currentPage = 0;

  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  text: splashData[index]["text"]!,
                  image: splashData[index]["image"]!,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => dotBuilder(
                          index: index,
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 3,
                    ),
                    MyButton(
                      text: "Continue",
                      press: () {
                        Navigator.pushReplacementNamed(
                            context, SingInScreen.routesName);
                      },
                    ),
                    Spacer(
                      flex: 2,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer dotBuilder({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(
        right: 5,
      ),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? kPrimaryColor : Color(0xffd8d8d8),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}
