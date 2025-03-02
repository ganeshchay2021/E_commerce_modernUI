import 'package:e_commerce_modernui/utils/app_text_styles.dart';
import 'package:e_commerce_modernui/widgets/custom_iconbutton.dart';
import 'package:e_commerce_modernui/widgets/filtered_bottom_sheet.dart';
import 'package:e_commerce_modernui/widgets/product_grid.dart';
import 'package:flutter/material.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Product",
          style: AppTextstyles.withColor(
            AppTextstyles.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
        leading: CustomIconbutton(
          icon: Icons.arrow_back_ios,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              FilteredBottomSheet.show(context);
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_list),
          ),
        ],
      ),
      body: const Expanded(child: ProductGrid()),
    );
  }
}
