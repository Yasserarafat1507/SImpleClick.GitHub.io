import 'package:flutter/material.dart';
import 'package:ui_ecommerce/sized_config.dart';

class BannerDiscount extends StatelessWidget {
  const BannerDiscount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: EdgeInsets.all(getPropScreenWidth(20)),
      decoration: BoxDecoration(
        color: Color(0xff4a3298),
        borderRadius: BorderRadius.circular(15)),
        child: Text.rich(
          TextSpan(
            style: TextStyle(
              color: Colors.white,
            ),
            children: [
              TextSpan(
                text: "A Summer Suprise\n",
                style: TextStyle(
                  fontSize: getPropScreenHeight(20),
                )
                ),
              TextSpan(
                text: "Cashback 20%",
                style: TextStyle(
                  fontSize: getPropScreenWidth(24),
                  fontWeight: FontWeight.bold,
                )
              ),
            ]
          )
        ),
    );
  }
}

