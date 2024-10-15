import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/sized_config.dart';

class iconWithTigger extends StatelessWidget {
  const iconWithTigger({
    super.key,
    required this.svgIcon,
    this.tigger,
  });

  final String svgIcon;
  final String? tigger;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: getPropScreenWidth(46),
          width: getPropScreenWidth(46),
          padding: EdgeInsets.all(getPropScreenWidth(12)),
          decoration: BoxDecoration(
              color: kSecoundaryColor.withOpacity(0.1), shape: BoxShape.circle),
          child: SvgPicture.asset(svgIcon),
        ),
        if (tigger != null && tigger != "0")
          Positioned(
              right: 0,
              top: -3,
              child: Container(
                height: getPropScreenWidth(16),
                width: getPropScreenWidth(16),
                decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    border: Border.all(width: 1.5, color: Colors.white)),
                child: Center(
                  child: Text(
                    tigger!,
                    style: TextStyle(
                      fontSize: getPropScreenWidth(10),
                      color: Colors.white,
                      height: 1,
                    ),
                  ),
                ),
              ))
      ],
    );
  }
}
