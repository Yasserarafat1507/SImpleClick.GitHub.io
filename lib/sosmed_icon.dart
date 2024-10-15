import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_ecommerce/sized_config.dart';

class SosMed extends StatelessWidget {
  const SosMed({
    super.key, required this.icon, required this.press,
  });

  final String icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(getPropScreenWidth(12)),
        height: getPropScreenHeight(40),
        width: getPropScreenWidth(40),
        decoration: BoxDecoration(
          color: Color(0xfff5f6f9),
          shape: BoxShape.circle
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}