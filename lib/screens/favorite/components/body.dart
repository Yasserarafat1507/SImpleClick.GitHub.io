import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/model/card.dart';
import 'package:ui_ecommerce/model/product_data.dart';
import 'package:ui_ecommerce/screens/details/detail_screen.dart';
import 'package:ui_ecommerce/sized_config.dart';
import 'package:ui_ecommerce/state_management/cart_provider.dart';
import 'package:ui_ecommerce/state_management/favorite_provider.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  late final controller = SlidableController(this);
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(
      builder: (context, favourites, child) {
        if (favourites.favoriteProducts.isEmpty) {
          return const Center(
            child: Text('No favourite products'),
          );
        }
        return ListView.builder(
          itemCount: favourites.favoriteProducts.length,
          itemBuilder: (context, index) {
            final Product favourite = favourites.favoriteProducts[index];
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, DetailScreen.routesName,
                    arguments: favourite);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getPropScreenWidth(20),
                  vertical: getPropScreenWidth(10),
                ),
                child: Slidable(
                  key: Key(favourite.id.toString()),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          Provider.of<CartProvider>(context, listen: false)
                              .addCartItem(
                                  Cart(product: favourite, numOfItem: 1));
                          favourites.toggleFavoriteStatus(favourite.id);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Added to cart'),
                            duration: Duration(seconds: 2),
                          ));
                        },
                        icon: Icons.shopping_cart,
                        label: 'Cart',
                        padding: EdgeInsets.all(getPropScreenWidth(20)),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                      ),
                      SlidableAction(
                        onPressed: (context) {
                          favourites.toggleFavoriteStatus(favourite.id);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Removed from favourite'),
                            duration: Duration(seconds: 2),
                          ));
                        },
                        padding: EdgeInsets.symmetric(
                            horizontal: getPropScreenWidth(20)),
                        icon: Icons.delete,
                        label: 'Delete',
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.red,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(getPropScreenWidth(10)),
                          bottomRight: Radius.circular(getPropScreenWidth(10)),
                        ),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: getPropScreenWidth(88),
                        child: AspectRatio(
                          aspectRatio: 0.88,
                          child: Container(
                            padding: EdgeInsets.all(getPropScreenWidth(20)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: kSecoundaryColor.withOpacity(0.2),
                            ),
                            child: Image.asset(
                              favourite.images[0],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            favourite.title,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text.rich(TextSpan(children: [
                            TextSpan(
                              text: "\$${favourite.price}",
                              style: TextStyle(
                                fontSize: getPropScreenWidth(14),
                                fontWeight: FontWeight.w600,
                                color: kPrimaryColor,
                              ),
                            ),
                          ])),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
