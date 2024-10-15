import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_ecommerce/sized_config.dart';

class CostumSuffixIcon extends StatelessWidget {
  const CostumSuffixIcon({
    super.key, required this.icon, required this.width,
  });

  final String icon;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0, 
        getPropScreenWidth(20), 
        getPropScreenWidth(20), 
        getPropScreenWidth(20),
        ),
      child: SvgPicture.asset(
        icon,
        width: getPropScreenWidth(width),
        ),
    );
  }
}
