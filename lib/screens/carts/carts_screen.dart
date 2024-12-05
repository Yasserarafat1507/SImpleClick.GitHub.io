import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/screens/carts/components/cart_bottom_bar.dart';
import 'package:ui_ecommerce/state_management/cart_provider.dart';

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
          Consumer<CartProvider>(
              builder: (context, cart, child) => Text("Your Cart",
                  style: Theme.of(context).textTheme.bodyLarge)),
        ],
      ),
    );
  }
}
