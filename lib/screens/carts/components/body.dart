import 'package:flutter/material.dart';
import 'package:ui_ecommerce/model/card.dart';
import 'package:ui_ecommerce/screens/carts/components/item_card.dart';
import 'package:ui_ecommerce/sized_config.dart';

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listCart.length,
        itemBuilder: (context, index) {
          final Cart cart = listCart[index];
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getPropScreenWidth(20),
                vertical: getPropScreenWidth(10)),
            child: Dismissible(
              key: Key(cart.product.id.toString()),
              direction: DismissDirection.startToEnd,
              onDismissed: (direction) {
                setState(() {
                  listCart.removeAt(index);
                });
              },
              background: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: getPropScreenWidth(20)),
                      child: Icon(Icons.delete,
                          color: Colors.white, size: getPropScreenWidth(30)),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              child: ItemCard(
                cart: cart,
              ),
            ),
          );
        });
  }
}
