import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/components/my_button.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/sized_config.dart';
import 'package:ui_ecommerce/state_management/cart_provider.dart';
import 'package:ui_ecommerce/state_management/theme_provider.dart';

class CartBottomBar extends StatelessWidget {
  const CartBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getPropScreenWidth(30),
        vertical: getPropScreenHeight(15),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: themeProvider.isDarkMode
              ? const Color.fromARGB(255, 24, 36, 46)
              : Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, -15),
                blurRadius: 20,
                color: themeProvider.isDarkMode
                    ? const Color.fromARGB(255, 24, 36, 46)
                    : Color(0xffdadada).withOpacity(0.30)),
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
                    color: themeProvider.isDarkMode
                        ? const Color.fromARGB(255, 38, 53, 65)
                        : Color(0xfff5f6f9),
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
              Icon(
                Icons.arrow_forward_ios_rounded,
              )
            ],
          ),
          SizedBox(
            height: getPropScreenWidth(20),
          ),
          Consumer<CartProvider>(
            builder: (context, cart, child) => Row(
              children: [
                Text.rich(TextSpan(children: [
                  TextSpan(text: "Total\n"),
                  TextSpan(
                      text: "\$${cart.totalPrice}",
                      style: TextStyle(fontSize: 16))
                ])),
                Spacer(),
                SizedBox(
                    width: getPropScreenWidth(190),
                    child: MyButton(
                      text: "Check Out",
                      press: () {
                        cart.clearCart();

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Check out success"),
                          ),
                        );
                      },
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
