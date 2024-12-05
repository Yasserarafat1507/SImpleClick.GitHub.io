import 'package:flutter/material.dart';
import 'package:ui_ecommerce/sized_config.dart';

class SettingAsset extends StatelessWidget {
  const SettingAsset({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: getPropScreenWidth(115),
        height: getPropScreenWidth(115),
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            Icon(
              Icons.settings,
              size: 100,
            )
          ],
        ),
      ),
    );
  }
}

class ItemButtonServices extends StatelessWidget {
  const ItemButtonServices({
    super.key,
    required this.icon,
    required this.title,
    required this.press,
  });

  final Icon icon;
  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: getPropScreenWidth(20),
            vertical: getPropScreenWidth(15)),
        padding: EdgeInsets.all(getPropScreenWidth(20)),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Theme.of(context).iconTheme.color!, // Border dinamis
          ),
        ),
        child: Row(
          children: [
            icon,
            SizedBox(
              width: 15,
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getPropScreenWidth(14),
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios_outlined)
          ],
        ),
      ),
    );
  }
}
