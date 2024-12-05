import 'package:flutter/material.dart';
import 'package:ui_ecommerce/sized_config.dart';

class BannerDiscount extends StatelessWidget {
  const BannerDiscount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {},
        child: Stack(children: [
          Container(
            width: double.infinity,
            height: getPropScreenWidth(120),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            margin: EdgeInsets.all(getPropScreenWidth(20)),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/img banner summer.png"),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(15)),
          ),
          Container(
            width: double.infinity,
            height: getPropScreenWidth(120),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            margin: EdgeInsets.all(getPropScreenWidth(20)),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.1),
                ]),
                borderRadius: BorderRadius.circular(15)),
            child: Text.rich(TextSpan(
                style: TextStyle(
                  color: Colors.white,
                ),
                children: [
                  TextSpan(
                      text: "for new users\n",
                      style: TextStyle(
                        fontSize: getPropScreenHeight(20),
                      )),
                  TextSpan(
                      text: "70% discount\n",
                      style: TextStyle(
                        fontSize: getPropScreenWidth(24),
                        fontWeight: FontWeight.bold,
                      )),
                  TextSpan(
                      text: "until August 15",
                      style: TextStyle(
                        fontSize: getPropScreenHeight(20),
                      )),
                ])),
          ),
        ]),
      ),
    );
  }
}
