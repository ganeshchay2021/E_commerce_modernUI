import 'package:e_commerce_modernui/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CategoryChip extends StatefulWidget {
  const CategoryChip({super.key});

  @override
  State<CategoryChip> createState() => _CategoryChipState();
}

class _CategoryChipState extends State<CategoryChip> {
  int selectedIndex = 0;

  final List<String> category = ["All", "Men", "Women", "Girls"];
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: List.generate(category.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn,
                child: ChoiceChip(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  label: Text(
                    category[index],
                    style: AppTextstyles.withColor(
                      selectedIndex == index
                          ? AppTextstyles.withWeight(
                              AppTextstyles.bodySmall, FontWeight.w600)
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
                  elevation: selectedIndex == index ? 2 : 0,
                  pressElevation: 0,
                  labelPadding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 1,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 7,
                  ),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  side: BorderSide(
                    width: 1,
                    color: selectedIndex == index
                        ? Colors.transparent
                        : isDark
                            ? Colors.grey[700]!
                            : Colors.grey[300]!,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
