import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/model/product_data.dart';
import 'package:ui_ecommerce/sized_config.dart';

class DetailDescription extends StatelessWidget {
  const DetailDescription({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
          child: Text(
            product.title,
            style: TextStyle(
                fontSize: getPropScreenWidth(20),
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(getPropScreenWidth(15)),
            width: getPropScreenWidth(64),
            decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(getPropScreenWidth(20)),
                    bottomLeft: Radius.circular(getPropScreenWidth(20)))),
            child: Icon(
              Icons.favorite,
              color: product.isFavourite
                  ? Colors.red
                  : kSecoundaryColor.withOpacity(0.5),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getPropScreenWidth(20),
            right: getPropScreenWidth(64),
          ),
          child: ReadMoreText(
            product.description,
            trimMode: TrimMode.Line,
            trimLines: 2,
            colorClickableText: kPrimaryColor,
            trimCollapsedText: "\n> See more",
            trimExpandedText: "\n< See less",
            moreStyle: seeMoreStyle,
            lessStyle: seeMoreStyle,
          ),
        )
      ],
    );
  }
}
