import 'package:e_commerce_modernui/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    Color color = isDark ? Colors.grey[300]! : Colors.grey[700]!;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        style: AppTextstyles.withColor(
          AppTextstyles.buttonMedium,
          Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: color,
          ),
          suffixIcon: Icon(
            Icons.tune,
            color: color,
          ),
          hintText: "Search",
          hintStyle: AppTextstyles.withColor(
            AppTextstyles.buttonMedium,
            color,
          ),
          filled: true,
          fillColor: isDark ? Colors.grey[600] : Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: color, width: 1)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 1),
          ),
        ),
      ),
    );
  }
}
