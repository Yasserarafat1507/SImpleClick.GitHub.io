import 'package:flutter/material.dart';
import 'package:ui_ecommerce/model/product_data.dart';

class FavoriteProvider with ChangeNotifier {
  List<Product> _listProducts = demoProducts;
// get favorite products = true from list products

  List<Product> get listproducts => _listProducts;

  FavoriteProvider() {
    print(favoriteProducts.asMap());
  }

  List<Product> get favoriteProducts {
    return _listProducts.where((product) => product.isFavourite).toList();
  }

  void toggleFavoriteStatus(int id) {
    final productIndex =
        _listProducts.indexWhere((product) => product.id == id);
    _listProducts[productIndex].isFavourite =
        !_listProducts[productIndex].isFavourite;
    notifyListeners();
  }
}