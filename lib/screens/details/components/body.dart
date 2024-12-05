import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/components/my_button.dart';
import 'package:ui_ecommerce/components/rounded_icon_button.dart';
import 'package:ui_ecommerce/model/card.dart';
import 'package:ui_ecommerce/model/product_data.dart';
import 'package:ui_ecommerce/screens/details/components/color_picker.dart';
import 'package:ui_ecommerce/screens/details/components/detail_description.dart';
import 'package:ui_ecommerce/screens/details/components/img_detail.dart';
import 'package:ui_ecommerce/screens/details/components/rouded_container.dart';
import 'package:ui_ecommerce/sized_config.dart';
import 'package:ui_ecommerce/state_management/cart_provider.dart';

class Body extends StatefulWidget {
  const Body({super.key, required this.product});

  final Product product;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentSelectionColor = 0;
  int totalSelected = 1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ImageDetail(product: widget.product),
            RoundedContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DetailDescription(product: widget.product),
                  SizedBox(height: getPropScreenWidth(40)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getPropScreenWidth(20)),
                    child: Row(children: [
                      ...List.generate(widget.product.colors.length, (index) {
                        final Color color = widget.product.colors[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              currentSelectionColor = index;
                            });
                          },
                          child: ItemColorDot(
                            color: color,
                            isSelected: index == currentSelectionColor,
                          ),
                        );
                      }),
                      Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: RoundedIconBtn(
                                icon: Icons.remove,
                                color: Colors.red,
                                press: totalSelected > 1
                                    ? () {
                                        setState(() {
                                          totalSelected--;
                                        });
                                      }
                                    : null),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "$totalSelected",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            child: RoundedIconBtn(
                                icon: Icons.add,
                                color: Colors.green,
                                press: () {
                                  setState(() {
                                    totalSelected++;
                                  });
                                }),
                          ),
                        ],
                      )
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getPropScreenWidth(70),
                        vertical: getPropScreenWidth(20)),
                    child: MyButton(
                        text: "Add To Cart",
                        press: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .addCartItem(Cart(
                                  product: widget.product,
                                  numOfItem: totalSelected));
                        }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
