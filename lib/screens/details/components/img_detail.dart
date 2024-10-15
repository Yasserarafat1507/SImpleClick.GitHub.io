import 'package:flutter/material.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/model/product_data.dart';
import 'package:ui_ecommerce/sized_config.dart';

class ImageDetail extends StatefulWidget {
  const ImageDetail({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ImageDetail> createState() => _ImageDetailState();
}

class _ImageDetailState extends State<ImageDetail> {
  int currentIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getPropScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1.04,
            child: Hero(
             tag: widget.product.images[currentIndex],
             child: Image.asset(
              widget.product.images[currentIndex]
            )
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.product.images.length, 
            (index){
              return smallImage(index:index);
            }
          )
        )
      ],
    );
  }

  Widget smallImage({required  int index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: AnimatedContainer(
              margin: EdgeInsets.symmetric(horizontal: getPropScreenWidth(5)),
              duration: defaultDuration,
              padding: EdgeInsets.all(getPropScreenHeight(8)),
              height: getPropScreenWidth(48),
              width: getPropScreenWidth(48),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: kPrimaryColor.withOpacity(
                    currentIndex == index? 1 : 0 
                  ),
                ),
                color: Colors.white
              ),
              child: Image.asset(widget.product.images[index]),
            ),
    );
  }
}