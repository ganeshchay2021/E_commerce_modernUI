import 'package:e_commerce_modernui/model/product_model.dart';
import 'package:e_commerce_modernui/utils/app_text_styles.dart';
import 'package:e_commerce_modernui/utils/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final List<ProductModel> favouriteProduct =
      products.where((p) => p.isFavourite).toList();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Wishlist",
          style: AppTextstyles.withColor(
            AppTextstyles.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              context.read<ThemeCubit>().toggle();
            },
            icon: const Icon(Icons.dark_mode),
          ),
        ],
      ),
      body: CustomScrollView(
        //wishlits section
        slivers: [
          SliverToBoxAdapter(
            child: _buildSummarySection(context),
          ),

          //wishlist product list
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return _buildFavouriteProductList(
                    context, favouriteProduct[index]);
              }, childCount: favouriteProduct.length),
            ),
          ),
        ],
      ),
    );
  }

  //build summary section
  Widget _buildSummarySection(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[850]! : Colors.grey[100]!,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${favouriteProduct.length} Items",
                  style: AppTextstyles.withColor(
                    AppTextstyles.h2,
                    Theme.of(context).textTheme.bodyLarge!.color!,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "in your wishlist",
                  style: AppTextstyles.withColor(
                    AppTextstyles.bodyMedium,
                    isDark ? Colors.grey[300]! : Colors.grey[700]!,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              print(favouriteProduct[0].name);
            },
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                backgroundColor: Theme.of(context).primaryColor),
            child: Text(
              "Add All to Cart",
              style: AppTextstyles.withColor(
                AppTextstyles.buttonMedium,
                Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  //build favourite product list
  Widget _buildFavouriteProductList(
      BuildContext context, ProductModel product) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.2)
                : Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(12),
            ),
            child: Image.asset(
              product.imageUrl,
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: AppTextstyles.withColor(
                      AppTextstyles.bodyLarge,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    product.category,
                    style: AppTextstyles.withColor(
                      AppTextstyles.bodySmall,
                      isDark ? Colors.grey[300]! : Colors.grey[600]!,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rs.${product.price}",
                        style: AppTextstyles.withColor(
                          AppTextstyles.h3,
                          Theme.of(context).textTheme.bodyLarge!.color!,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.shopping_cart_outlined,
                                color: Theme.of(context).primaryColor),
                          ),
                          IconButton(
                            onPressed: () {
                              _showDeleteComfirmDialog(context);
                            },
                            icon: const Icon(
                              Icons.delete_outline,
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  //delete confirm dialog box
  void _showDeleteComfirmDialog(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showDialog(
      barrierColor: Colors.black54,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          contentPadding: const EdgeInsets.all(24),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red[400]!.withOpacity(0.1)),
                child: Icon(
                  Icons.delete_outline,
                  color: Colors.red[400],
                  size: 32,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Remove Item",
                style: AppTextstyles.withColor(
                  AppTextstyles.h3,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Are you sure you want to remove this item from your cart?",
                textAlign: TextAlign.center,
                style: AppTextstyles.withColor(
                  AppTextstyles.bodyMedium,
                  isDark ? Colors.grey[300]! : Colors.grey[700]!,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: Text(
                        "Cancel",
                        style: AppTextstyles.withColor(
                          AppTextstyles.buttonMedium,
                          isDark ? Colors.grey[300]! : Colors.grey[700]!,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          backgroundColor: Theme.of(context).primaryColor),
                      child: Text(
                        "Remove",
                        style: AppTextstyles.withColor(
                            AppTextstyles.buttonMedium, Colors.white),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
