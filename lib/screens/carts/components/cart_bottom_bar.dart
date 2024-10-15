import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_ecommerce/components/my_button.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/sized_config.dart';

class CartBottomBar extends StatelessWidget {
  const CartBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getPropScreenWidth(30),
        vertical: getPropScreenHeight(15),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, -15),
                blurRadius: 20,
                color: Color(0xffdadada).withOpacity(0.30)),
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: getPropScreenWidth(40),
                width: getPropScreenWidth(40),
                decoration: BoxDecoration(
                    color: Color(0xfff5f6f9),
                    borderRadius: BorderRadius.circular(10)),
                child: SvgPicture.asset(
                  "assets/icons/receipt.svg",
                  color: kPrimaryColor,
                ),
              ),
              Spacer(),
              Text(
                "Add Voucher Code",
              ),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.arrow_forward_ios_rounded)
            ],
          ),
          SizedBox(
            height: getPropScreenWidth(20),
          ),
          Row(
            children: [
              Text.rich(TextSpan(children: [
                TextSpan(text: "Total\n"),
                TextSpan(
                    text: "\$377.15",
                    style: TextStyle(fontSize: 16, color: Colors.black))
              ])),
              Spacer(),
              SizedBox(
                  width: getPropScreenWidth(190),
                  child: MyButton(text: "Check Out", press: () {}))
            ],
          ),
        ],
      ),
    );
  }
}
