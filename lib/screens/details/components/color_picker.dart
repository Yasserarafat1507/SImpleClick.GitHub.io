import 'package:flutter/material.dart';
import 'package:ui_ecommerce/components/rounded_icon_button.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/model/product_data.dart';
import 'package:ui_ecommerce/sized_config.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  int currentSelectionColor = 0;
  int totalSelecter = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
      child: Row(children: [
        ...List.generate(widget.product.colors.length, (index) {
          final Color color = widget.product.colors[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                currentSelectionColor = index;
              });
            },
            child: ItemColorDot(
              color: color,
              isSelected: index == currentSelectionColor,
            ),
          );
        }),
        Spacer(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: RoundedIconBtn(
                  icon: Icons.remove,
                  press: totalSelecter > 1
                      ? () {
                          setState(() {
                            totalSelecter--;
                          });
                        }
                      : null),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "$totalSelecter",
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
              ),
            ),
            SizedBox(
              child: RoundedIconBtn(
                  icon: Icons.add,
                  press: () {
                    setState(() {
                      totalSelecter++;
                    });
                  }),
            ),
          ],
        )
      ]),
    );
  }
}

class ItemColorDot extends StatelessWidget {
  const ItemColorDot({super.key, required this.color, this.isSelected = false});

  final bool isSelected;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: defaultDuration,
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(getPropScreenWidth(8)),
      height: getPropScreenWidth(isSelected ? 30 : 20),
      width: getPropScreenWidth(isSelected ? 30 : 20),
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
              color: isSelected ? kPrimaryColor : Colors.transparent,
              width: 1.5)),
    );
  }
}
