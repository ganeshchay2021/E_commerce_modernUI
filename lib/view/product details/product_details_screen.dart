// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_modernui/widgets/product_size_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_commerce_modernui/model/product_model.dart';
import 'package:e_commerce_modernui/utils/app_text_styles.dart';
import 'package:e_commerce_modernui/utils/cubit/theme_cubit.dart';
import 'package:e_commerce_modernui/widgets/custom_iconbutton.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;
  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: CustomIconbutton(
          icon: Icons.arrow_back_ios,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {
              context.read<ThemeCubit>().toggle();
            },
            icon: const Icon(Icons.dark_mode),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Hero(
                    tag: widget.product.imageUrl,
                    child: Image.asset(
                      widget.product.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      widget.product.isFavourite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: widget.product.isFavourite
                          ? Theme.of(context).primaryColor
                          : isDark
                              ? Colors.grey[300]!
                              : Colors.grey[700]!,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.product.name,
                          style: AppTextstyles.withColor(AppTextstyles.h2,
                              Theme.of(context).textTheme.headlineMedium!.color!),
                        ),
                      ),
                      Text(
                        "Rs.${widget.product.price.toString()}",
                        style: AppTextstyles.withColor(
                          AppTextstyles.h2,
                          Theme.of(context).textTheme.headlineMedium!.color!,
                        ).copyWith(height: 0),
                      ),
                    ],
                  ),
                  Text(
                    widget.product.category,
                    style: AppTextstyles.withColor(
                      AppTextstyles.bodyMedium,
                      isDark ? Colors.white : Colors.grey[700]!,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Text(
                    "Select Size",
                    style: AppTextstyles.withColor(
                      AppTextstyles.buttonMedium,
                      Theme.of(context).textTheme.bodyMedium!.color!,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.008,
                  ),
        
                  //Product Size Category
                  const ProductSizeChip(),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Text(
                    "Description",
                    style: AppTextstyles.withColor(
                      AppTextstyles.buttonMedium,
                      Theme.of(context).textTheme.bodyMedium!.color!,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.008,
                  ),
                  Text(
                    widget.product.description,
                    style: AppTextstyles.withColor(
                      AppTextstyles.bodyMedium,
                      isDark ? Colors.white : Colors.grey[700]!,
                    ).copyWith(height: 1.5),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(
          screenWidth * 0.04,
        ),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.all(screenWidth * 0.03),
                    elevation: 0,
                    side: BorderSide(
                      color: isDark ? Colors.white70 : Colors.black,
                    )),
                child: Text(
                  "Add to cart",
                  style: AppTextstyles.withColor(
                    AppTextstyles.buttonMedium,
                    Theme.of(context).textTheme.bodyMedium!.color!,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: screenWidth * 0.04,
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(screenWidth * 0.03),
                    backgroundColor: Theme.of(context).primaryColor),
                child: Text(
                  "Buy Now",
                  style: AppTextstyles.withColor(
                    AppTextstyles.buttonMedium,
                    Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
