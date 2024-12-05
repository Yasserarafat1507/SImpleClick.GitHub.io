import 'package:flutter/material.dart';
import 'package:ui_ecommerce/model/card.dart';
import 'package:ui_ecommerce/model/product_data.dart';

class CartProvider extends ChangeNotifier {
  final List<Cart> listCart = [
    Cart(product: demoProducts[0], numOfItem: 3),
    Cart(product: demoProducts[1], numOfItem: 2),
    Cart(product: demoProducts[3], numOfItem: 4),
  ];

  List<Cart> get cartItems => listCart;

  // remove cart
  void removeCartItem(Cart cartItems) {
    listCart.removeWhere((item) => item.product.id == cartItems.product.id);
    notifyListeners();
  }

  // add cart
  void addCartItem(Cart cartItems) {
    final index =
        listCart.indexWhere((item) => item.product.id == cartItems.product.id);

    if (index != -1) {
      listCart[index].numOfItem += cartItems.numOfItem;
    } else {
      listCart.add(cartItems);
    }

    notifyListeners();
  }

  double get totalPrice => double.parse(
        listCart
            .fold(
                0.0,
                (double total, current) =>
                    total + current.product.price * current.numOfItem)
            .toStringAsFixed(2),
      );

  void clearCart() {
    listCart.clear();
    notifyListeners();
  }
}
