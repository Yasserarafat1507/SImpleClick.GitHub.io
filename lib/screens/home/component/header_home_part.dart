import 'package:flutter/material.dart';
import 'package:ui_ecommerce/model/card.dart';
import 'package:ui_ecommerce/screens/carts/carts_screen.dart';
import 'package:ui_ecommerce/screens/home/component/icon_with_trigger.dart';
import 'package:ui_ecommerce/screens/home/component/search.dart';
import 'package:ui_ecommerce/sized_config.dart';

class headerHomePart extends StatelessWidget {
  const headerHomePart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, CartsScreen.routesName);
            },
            child: iconWithTigger(
              svgIcon: 'assets/icons/Cart Icon.svg',
              tigger: listCart.length.toString(),
            ),
          ),
          iconWithTigger(
            svgIcon: 'assets/icons/Bell.svg',
          ),
        ],
      ),
    );
  }
}
