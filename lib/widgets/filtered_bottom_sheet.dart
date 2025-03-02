import 'package:e_commerce_modernui/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class FilteredBottomSheet {
  static void show(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showModalBottomSheet(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Filtered Products",
                        style: AppTextstyles.withColor(
                          AppTextstyles.h3,
                          Theme.of(context).textTheme.bodyLarge!.color!,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "Price Range",
                  style: AppTextstyles.withColor(
                    AppTextstyles.bodyLarge,
                    Theme.of(context).textTheme.bodyLarge!.color!,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.none,
                        decoration: InputDecoration(
                          hintText: " Min",
                          prefixText: "\$",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: isDark
                                    ? Colors.grey[300]!
                                    : Colors.grey[700]!),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.none,
                        decoration: InputDecoration(
                          hintText: " Max",
                          prefixText: "\$",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: isDark
                                    ? Colors.grey[300]!
                                    : Colors.grey[700]!),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "Category",
                  style: AppTextstyles.withColor(
                    AppTextstyles.bodyLarge,
                    Theme.of(context).textTheme.bodyLarge!.color!,
                  ),
                ),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    "All",
                    "Shoes",
                    "Clothings",
                    "Accessories",
                    "Bags",
                    "Electrics",
                  ]
                      .map(
                        (category) => FilterChip(
                          label: Text(category),
                          selected: category == "All",
                          onSelected: (value) {},
                          backgroundColor: Theme.of(context).cardColor,
                          selectedColor:
                              Theme.of(context).primaryColor.withOpacity(
                                    0.2,
                                  ),
                          labelStyle: AppTextstyles.withColor(
                            AppTextstyles.bodyMedium,
                            category == 'All'
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).textTheme.bodyLarge!.color!,
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Apply Filter",
                      style: AppTextstyles.withColor(
                        AppTextstyles.buttonMedium,
                        Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
