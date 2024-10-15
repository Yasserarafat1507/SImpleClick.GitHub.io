import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/model/product_data.dart';
import 'package:ui_ecommerce/sized_config.dart';

class ItemPoularProduct extends StatelessWidget {
  const ItemPoularProduct({
    super.key, required this.product, required this.press,
  });

  final Product product;
  final GestureTapCallback press;

  // Jika kSecondaryColor berasal dari constant.dart, pastikan sudah terdefinisi.
  // Jika belum, kita bisa inisialisasi default seperti berikut
  final Color kSecondaryColor = Colors.grey;  // Atau warna lain yang sesuai

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(10)),
      child: SizedBox(
        width: getPropScreenWidth(140),
        child: GestureDetector(
          onTap: press,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kSecondaryColor.withOpacity(0.2),
                  ),
                  child: Image.asset(
                    product.images[0],
                  ),
                ),
              ),
              SizedBox(height: getPropScreenHeight(15)),
              Text(product.title),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$ ${product.price}",
                    style: TextStyle(
                      fontSize: getPropScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(getPropScreenWidth(10)),
                    decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: product.isFavourite ? Colors.red : kSecondaryColor,
                      size: getPropScreenWidth(15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
