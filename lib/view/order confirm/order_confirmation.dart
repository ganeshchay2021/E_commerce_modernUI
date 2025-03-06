// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_modernui/view/Main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:e_commerce_modernui/utils/app_text_styles.dart';
import 'package:e_commerce_modernui/utils/assets.dart';
import 'package:e_commerce_modernui/widgets/custom_iconbutton.dart';

class OrderConfirmation extends StatelessWidget {
  final String orderNumber;

  const OrderConfirmation({
    super.key,
    required this.orderNumber,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: CustomIconbutton(
          icon: Icons.arrow_back_ios,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Order Comfirmation",
          style: AppTextstyles.withColor(
            AppTextstyles.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  Assets.orderComirmation,
                  width: 200,
                  height: 200,
                  repeat: false,
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  "Order Confirmed!",
                  style: AppTextstyles.withColor(
                    AppTextstyles.h2,
                    isDark ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Your order $orderNumber has been successfully placed",
                  textAlign: TextAlign.center,
                  style: AppTextstyles.withColor(AppTextstyles.bodyLarge,
                      isDark ? Colors.grey[100]! : Colors.grey[600]!),
                ),
                const SizedBox(
                  height: 48,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 48, vertical: 16),
                  ),
                  child: Text(
                    "Track Order",
                    style: AppTextstyles.withColor(
                      AppTextstyles.buttonMedium,
                      Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainScreen(),
                        ),
                        (route) => route.isFirst);
                  },
                  child: Text(
                    "Continue Shopping",
                    style: AppTextstyles.withColor(AppTextstyles.buttonMedium,
                        Theme.of(context).primaryColor),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
