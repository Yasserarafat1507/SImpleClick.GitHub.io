import 'package:flutter/material.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/model/product_data.dart';
import 'package:ui_ecommerce/screens/details/detail_screen.dart';
import 'package:ui_ecommerce/screens/home/component/banner_discount.dart';
import 'package:ui_ecommerce/screens/home/component/header_home_part.dart';
import 'package:ui_ecommerce/screens/home/component/item_category.dart';
import 'package:ui_ecommerce/screens/home/component/popular_item.dart';
import 'package:ui_ecommerce/screens/home/component/special_offer_card.dart';
import 'package:ui_ecommerce/sized_config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String query = "";

  @override
  Widget build(BuildContext context) {
    List<Product> products = [];
    for (Product product in demoProducts) {
      if (product.title.toLowerCase().contains(query.toLowerCase())) {
        products.add(product);
        }
    }
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getPropScreenHeight(20),
            ),
            headerHomePart(
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
            ),
            SizedBox(
              height: getPropScreenHeight(10),
            ),
            ...query != ""
                ? [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final Product product = products[index];
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, DetailScreen.routesName,
                                arguments: product);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: getPropScreenWidth(20),
                              vertical: getPropScreenWidth(10),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: getPropScreenWidth(88),
                                  child: AspectRatio(
                                    aspectRatio: 0.88,
                                    child: Container(
                                      padding: EdgeInsets.all(
                                          getPropScreenWidth(20)),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color:
                                            kSecoundaryColor.withOpacity(0.2),
                                      ),
                                      child: Image.asset(
                                        product.images[0],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.title,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text.rich(TextSpan(children: [
                                      TextSpan(
                                        text: "\$${product.price}",
                                        style: TextStyle(
                                          fontSize: getPropScreenWidth(14),
                                          fontWeight: FontWeight.w600,
                                          color: kPrimaryColor,
                                        ),
                                      ),
                                    ])),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  ]
                : [
                    BannerDiscount(),
                    ItemCategoris(),
                    SpecialOffers(),
                    SizedBox(
                      height: getPropScreenHeight(20),
                    ),
                    PopularItem(),
                  ],
            SizedBox(
              height: getPropScreenHeight(20),
            )
          ],
        ),
      ),
    );
  }
}
