import 'package:e_commerce_modernui/model/product_model.dart';
import 'package:e_commerce_modernui/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class ProductSizeChip extends StatefulWidget {
  const ProductSizeChip({super.key});

  @override
  State<ProductSizeChip> createState() => _ProductSizeChipState();
}

class _ProductSizeChipState extends State<ProductSizeChip> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      child: Row(
        children: List.generate(sizeList.length, (index) {
          final size = sizeList[index];
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeIn,
              child: ChoiceChip(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                label: Text(
                  size,
                  style: AppTextstyles.withColor(
                    selectedIndex == index
                        ? AppTextstyles.withWeight(
                            AppTextstyles.bodySmall, FontWeight.w800)
                        : AppTextstyles.bodySmall,
                    selectedIndex == index
                        ? Colors.white
                        : isDark
                            ? Colors.grey[100]!
                            : Colors.grey[700]!,
                  ),
                ),
                selected: selectedIndex == index ? true : false,
                onSelected: (value) {
                  setState(() {
                    selectedIndex = value ? index : selectedIndex;
                  });
                },
                backgroundColor: isDark ? Colors.grey[600]! : Colors.grey[200],
                selectedColor: Theme.of(context).primaryColor,
                elevation: selectedIndex == index ? 3 : 0,
                pressElevation: 0,
                labelPadding: const EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 1,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 17,
                  vertical: 7,
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                side: BorderSide(
                  width: 1,
                  color: selectedIndex == index
                      ? Colors.transparent
                      : isDark
                          ? Colors.grey[300]!
                          : Colors.grey[700]!,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
