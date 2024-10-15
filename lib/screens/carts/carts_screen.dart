import 'package:flutter/material.dart';
import 'package:ui_ecommerce/screens/carts/components/cart_bottom_bar.dart';

import 'components/body.dart';

class CartsScreen extends StatelessWidget {
  static String routesName = "/carts";
  const CartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Body(),
      bottomNavigationBar: CartBottomBar(),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios)),
      title: Column(
        children: [
          Text("Your Cart", style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}
