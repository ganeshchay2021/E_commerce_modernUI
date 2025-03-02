import 'package:e_commerce_modernui/model/product_model.dart';
import 'package:e_commerce_modernui/view/product%20details/product_details_screen.dart';
import 'package:e_commerce_modernui/widgets/product_card.dart';
import 'package:flutter/cupertino.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.75),
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => ProductDetailsScreen(
                    product: product,
                  ),
                ),
              );
            },
            child: ProductCard(
              product: product,
            ),
          );
        },
      ),
    );
  }
}
