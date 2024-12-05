import 'package:flutter/material.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/sized_config.dart';

class SearchField extends StatelessWidget {
  final Function(String)? onChanged;
  const SearchField({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizedConfig.screenWidth * 0.6,
      decoration: BoxDecoration(
          color: kSecoundaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15)),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getPropScreenWidth(20),
                vertical: getPropScreenWidth(9)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search Product",
            prefixIcon: const Icon(Icons.search)),
      ),
    );
  }
}
