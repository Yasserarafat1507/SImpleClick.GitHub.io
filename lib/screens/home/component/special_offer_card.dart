import 'package:flutter/material.dart';
import 'package:ui_ecommerce/sized_config.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
      padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
      child: Column(
        children: [
          SectionTitle(title: "Special For You",),
        ],
      ),
    ),
    SizedBox(height: getPropScreenHeight(20),),
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(10)),
        child: Row(
          children: [
            SpecialOfferCard(image: 'assets/images/Image Banner 2.png', category: 'SmartPhone', numOfBrands: '20', press: () {  },),
            SpecialOfferCard(image: 'assets/images/Image Banner 3.png', category: 'Fesion', numOfBrands: '34', press: () {  },),
          ],
        ),
      ),
    )
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    super.key, required this.image, required this.category, required this.numOfBrands, required this.press,
  });

  final String image, category, numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getPropScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: Stack(
          children: [
            Container(
            width: getPropScreenWidth(242),
            height: getPropScreenWidth(100),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(20),
            ),
          ),
            Container(
            width: getPropScreenWidth(242),
            height: getPropScreenWidth(100),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xff343434).withOpacity(0.4),
                  Color(0xff343434).withOpacity(0.15),
                  ]),
                borderRadius: BorderRadius.circular(20),
            ),
          ),
            Positioned(
              left: getPropScreenWidth(10),
              top: getPropScreenWidth(10),
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    color: Colors.white
                  ),
                  children: [
                    TextSpan(
                      text: "$category\n", style: TextStyle(
                        fontSize: getPropScreenWidth(18),
                        fontWeight: FontWeight.bold,
                      )
                    ),
                    TextSpan(
                      text: "$numOfBrands Brands"
                    ),
                  ]
                )
              ),
              ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key, required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(
          fontSize: getPropScreenWidth(18),
          color: Colors.black,
        ),),
        Text("See More", style: TextStyle(
          fontSize: getPropScreenWidth(14),
          color: Colors.blue,
        ),)
      ],
    );
  }
}