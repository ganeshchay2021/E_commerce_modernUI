import 'package:e_commerce_modernui/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class SaleBanner extends StatelessWidget {
  const SaleBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Get",
                  style: AppTextstyles.withColor(
                    AppTextstyles.h3,
                    Colors.white,
                  ),
                ),
                Text(
                  "Spacel Sale",
                  style: AppTextstyles.withColor(
                    AppTextstyles.withWeight(
                      AppTextstyles.h2,
                      FontWeight.bold,
                    ),
                    Colors.white,
                  ),
                ),
                Text(
                  "Up to 40%",
                  style: AppTextstyles.withColor(
                    AppTextstyles.h3,
                    Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
            child: Text(
              "Shop Now",
              style: AppTextstyles.buttonMedium,
            ),
          )
        ],
      ),
    );
  }
}
