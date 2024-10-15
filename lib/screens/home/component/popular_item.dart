import 'package:flutter/material.dart';
import 'package:ui_ecommerce/components/item_popular.dart';
import 'package:ui_ecommerce/model/product_data.dart';
import 'package:ui_ecommerce/screens/details/detail_screen.dart';
import 'package:ui_ecommerce/screens/home/component/special_offer_card.dart';
import 'package:ui_ecommerce/sized_config.dart';

class PopularItem extends StatelessWidget {
  const PopularItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
          child: const SectionTitle(title: 'Popular Products',),
        ),
        SizedBox(height: getPropScreenHeight(20),),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: getPropScreenWidth(250),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: List.generate(
                  demoProducts.length, 
                  (index){
                    final Product product = demoProducts[index];
                    return ItemPoularProduct(product: demoProducts[index], press: () { Navigator.pushNamed(context, DetailScreen.routesName, arguments: product); },);
                  }
                )
              ),
            ),
          ),
        )
      ],
    );
  }
}

