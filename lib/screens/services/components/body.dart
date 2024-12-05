import 'package:flutter/material.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/screens/services/components/services_asset.dart';
import 'package:ui_ecommerce/sized_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ServicesAsset(),
          SizedBox(height: getPropScreenWidth(20)),
          ItemButtonServices(
            icon: Icon(
              Icons.account_circle,
              size: 22,
              color: kPrimaryColor,
            ),
            title: "My Account",
            press: () {},
          ),
          ItemButtonServices(
            icon: Icon(
              Icons.bug_report,
              size: 22,
              color: kPrimaryColor,
            ),
            title: "Bug Report",
            press: () {},
          ),
          ItemButtonServices(
            icon: Icon(
              Icons.verified_user,
              size: 22,
              color: kPrimaryColor,
            ),
            title: "security",
            press: () {},
          ),
          ItemButtonServices(
            icon: Icon(
              Icons.miscellaneous_services,
              size: 22,
              color: kPrimaryColor,
            ),
            title: "Help Center",
            press: () {},
          ),
        ],
      ),
    );
  }
}
