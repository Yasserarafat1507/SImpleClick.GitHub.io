import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/screens/carts/carts_screen.dart';
import 'package:ui_ecommerce/screens/home/component/icon_with_trigger.dart';
import 'package:ui_ecommerce/screens/home/component/search.dart';
import 'package:ui_ecommerce/sized_config.dart';
import 'package:ui_ecommerce/state_management/cart_provider.dart';

class headerHomePart extends StatelessWidget {
  final Function(String)? onChanged;
  const headerHomePart({
    super.key, this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(onChanged: onChanged,),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, CartsScreen.routesName);
            },
            child: Consumer<CartProvider>(
              builder: (context, cart, child) => iconWithTigger(
                svgIcon: 'assets/icons/Cart Icon.svg',
                tigger: cart.listCart.length.toString(),
              ),
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
