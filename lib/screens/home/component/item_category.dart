import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/model/category_data.dart';
import 'package:ui_ecommerce/sized_config.dart';
import 'package:ui_ecommerce/state_management/theme_provider.dart';

Padding ItemCategoris() {
  return Padding(
    padding: EdgeInsets.all(getPropScreenWidth(20)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        listCategory.length,
        (index) => ItemCategory(
            name: listCategory[index].name, icon: listCategory[index].icon),
      ),
    ),
  );
}

class ItemCategory extends StatelessWidget {
  const ItemCategory({
    super.key,
    required this.name,
    required this.icon,
  });

  final String name, icon;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SizedBox(
      width: getPropScreenWidth(55),
      child: Container(
        width: getPropScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getPropScreenWidth(15)),
              width: getPropScreenWidth(55),
              height: getPropScreenWidth(55),
              decoration: BoxDecoration(
                color: themeProvider.isDarkMode
                    ? const Color.fromARGB(255, 24, 36, 46)
                    : Color(0xffffecdf),
                borderRadius: BorderRadius.circular(15),
              ),
              child: SvgPicture.asset(icon),
            ),
            SizedBox(
              height: getPropScreenHeight(5),
            ),
            Text(
              name,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
