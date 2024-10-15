import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/sized_config.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: getPropScreenWidth(115),
        height: getPropScreenWidth(115),
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/Profile Image.png"),
            ),
            Positioned(
              bottom: 0,
              right: -15,
              child: Container(
                height: getPropScreenWidth(46),
                padding: EdgeInsets.all(10),
                width: getPropScreenWidth(46),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xfff5f6f9),
                    border: Border.all(color: Colors.white)),
                child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItemButtonProfile extends StatelessWidget {
  const ItemButtonProfile({
    super.key,
    required this.svgIcon,
    required this.title,
    required this.press,
  });

  final String svgIcon;
  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: getPropScreenWidth(20),
            vertical: getPropScreenWidth(15)),
        padding: EdgeInsets.all(getPropScreenWidth(20)),
        decoration: BoxDecoration(
            color: Color(0xfff5f6f9), borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            SvgPicture.asset(
              svgIcon,
              color: kPrimaryColor,
              width: 22,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getPropScreenWidth(14),
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios_outlined)
          ],
        ),
      ),
    );
  }
}
