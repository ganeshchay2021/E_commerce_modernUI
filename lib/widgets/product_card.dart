// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_modernui/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce_modernui/model/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      constraints: BoxConstraints(
        maxWidth: screenWidth * 0.9,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.3)
                : Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(
              0,
              2,
            ),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Hero(
                    tag: product.imageUrl,
                    child: Image.asset(
                      product.imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              //favourite
              Positioned(
                top: 0,
                right: 8,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    product.isFavourite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: product.isFavourite
                        ? Theme.of(context).primaryColor
                        : isDark
                            ? Colors.grey[300]!
                            : Colors.grey[700]!,
                  ),
                ),
              ),

              //discount
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    "${calculteDiscount(product.oldPrice!, product.price)}% OFF",
                    style: AppTextstyles.withColor(
                      AppTextstyles.buttonMedium,
                      Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextstyles.withWeight(
                    AppTextstyles.withColor(
                      AppTextstyles.h3,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                    FontWeight.bold,
                  ),
                ),
                Text(
                  product.category,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextstyles.withColor(
                    AppTextstyles.bodyMedium,
                    isDark ? Colors.grey[300]! : Colors.grey[700]!,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      product.price.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextstyles.withWeight(
                        AppTextstyles.withColor(
                          AppTextstyles.h3,
                          Theme.of(context).textTheme.bodyLarge!.color!,
                        ),
                        FontWeight.bold,
                      ),
                    ),
                    if (product.oldPrice != null) ...[
                      SizedBox(
                        width: screenWidth * 0.01,
                      ),
                      Text(
                        product.oldPrice!.toString(),
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          overflow: TextOverflow.clip,
                          fontSize: screenWidth*0.04,
                          color: isDark ? Colors.grey[300]! : Colors.grey[700]!,
                        ),
                      ),
                    ]
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  int calculteDiscount(double oldPrice, double price) {
    return (((oldPrice - price) / oldPrice) * 100).round();
  }
}
