import 'package:e_commerce_modernui/utils/app_text_styles.dart';
import 'package:e_commerce_modernui/widgets/category_chip.dart';
import 'package:e_commerce_modernui/widgets/filtered_bottom_sheet.dart';
import 'package:e_commerce_modernui/widgets/product_grid.dart';
// ignore: unused_import
import 'package:e_commerce_modernui/widgets/sale_banner.dart';
import 'package:flutter/material.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shopping",
          style: AppTextstyles.withColor(
            AppTextstyles.h3,
            isDark ? Colors.white : Colors.black,
          ),
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
      body: const SafeArea(
        child: Column(
          children: [
            //category chip
            CategoryChip(),
            SizedBox(
              height: 10,
            ),
            //product grid
            Expanded(
              child: ProductGrid(),
            )
          ],
        ),
      ),
    );
  }
}
