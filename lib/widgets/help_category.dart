import 'package:e_commerce_modernui/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class HelpCategory extends StatefulWidget {
  const HelpCategory({super.key});

  @override
  State<HelpCategory> createState() => _HelpCategoryState();
}

class _HelpCategoryState extends State<HelpCategory> {
  final helpCategory = [
    {"icon": Icons.shopping_bag_outlined, "title": "Orders"},
    {"icon": Icons.payment_outlined, "title": "Payments"},
    {"icon": Icons.local_shipping_outlined, "title": "Shipping"},
    {"icon": Icons.assignment_return_outlined, "title": "Returns"},
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: helpCategory.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.5),
      itemBuilder: (context, index) {
        return _buildCategoryCard(
            context,
            helpCategory[index]['icon']! as IconData,
            helpCategory[index]['title']! as String);
      },
    );
  }

  Widget _buildCategoryCard(BuildContext context, IconData icon, String title) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        if (title == "Orders") {
          //go to order related question page
        } else if (title == "Payments") {
          //go to payments related question page
        } else if (title == "Shipping") {
          //go to shipping related question page
        } else if (title == "Returns") {
          //go to returns related question page
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: isDark ? Colors.grey[600]! : Colors.grey[200]!,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              title,
              style: AppTextstyles.withColor(
                AppTextstyles.bodyMedium,
                isDark ? Colors.grey[300]! : Colors.grey[700]!,
              ),
            )
          ],
        ),
      ),
    );
  }
}
