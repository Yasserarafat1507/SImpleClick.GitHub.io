import 'package:flutter/material.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/sized_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    super.key,
    required this.text,
    required this.image,
  });

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          "ClickSimple",
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: getPropScreenWidth(36),
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: getPropScreenWidth(14),
          ),
        ),
        Spacer(
          flex: 2,
        ),
        Image.asset(
          image,
          height: getPropScreenHeight(265),
          width: getPropScreenWidth(235),
        ),
      ],
    );
  }
}
