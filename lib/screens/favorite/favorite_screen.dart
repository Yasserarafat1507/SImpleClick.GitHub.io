import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/components/costume_navigator.dart';
import 'package:ui_ecommerce/enums.dart';
import 'package:ui_ecommerce/state_management/favorite_provider.dart';

import 'components/body.dart';

class FavouriteScreen extends StatelessWidget {
  static String routesName = "/favourite";
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "Your Favorites",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Consumer<FavoriteProvider>(
              builder: (context, fav, child) => Text(
                  "${fav.favoriteProducts.length} items",
                  style: Theme.of(context).textTheme.bodySmall),
            ),
          ],
        ),
      ),
      body: const Body(),
      bottomNavigationBar: CostumeButtonBar(
        menu: MenuState.favorite,
      ),
    );
  }
}
