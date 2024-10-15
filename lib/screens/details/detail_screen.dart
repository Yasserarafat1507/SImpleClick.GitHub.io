import 'package:flutter/material.dart';
import 'package:ui_ecommerce/model/product_data.dart';
import 'package:ui_ecommerce/sized_config.dart';
import 'components/body.dart';

class DetailScreen extends StatelessWidget {
  static String routesName = "/detail";
  const DetailScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 30,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
            child: Row(
              children: [
                Text(
                  "${product.rating}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20,
                ),
              ],
            ),
          )
        ],
      ),
      body: Body(
        product: product,
      ),
    );
  }
}
