import 'package:ui_ecommerce/model/product_data.dart';

class Cart {
  final Product product;
  final int numOfItem;

  Cart({
    required this.product,
    required this.numOfItem,
  });
}

final List<Cart> listCart = [
  Cart(product: demoProducts[0], numOfItem: 3),
  Cart(product: demoProducts[1], numOfItem: 2),
  Cart(product: demoProducts[3], numOfItem: 4),
];
