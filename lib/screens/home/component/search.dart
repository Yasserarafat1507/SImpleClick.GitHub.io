import 'package:flutter/material.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/sized_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizedConfig.screenWidth * 0.6,
      decoration: BoxDecoration(
        color: kSecoundaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) {},
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getPropScreenWidth(10),
                vertical: getPropScreenWidth(9)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search Product",
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }
}
