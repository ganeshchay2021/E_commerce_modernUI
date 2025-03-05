import 'package:e_commerce_modernui/utils/app_text_styles.dart';
import 'package:e_commerce_modernui/widgets/custom_iconbutton.dart';
import 'package:e_commerce_modernui/widgets/info_section.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: CustomIconbutton(
          icon: Icons.arrow_back_ios,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Privacy Policy",
          style: AppTextstyles.withColor(
            AppTextstyles.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(screenSize.width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InfoSection(
                title: "Information We Collect",
                subtitle:
                    "We collect information that you provide directly to us, including name, email address, shipping information",
              ),
              const InfoSection(
                title: "How We Use Your Information",
                subtitle:
                    "We use the information we collect to provide, maintain, and improve our services, process your transaction and send you updates.",
              ),
              const InfoSection(
                title: "Information Sharing",
                subtitle:
                    "We collect information that you provide directly to us, including name, email address, shipping information",
              ),
              const InfoSection(
                title: "Data Security",
                subtitle:
                    "We collect information that you provide directly to us, including name, email address, shipping information",
              ),
              const InfoSection(
                title: "Your Rights",
                subtitle:
                    "We collect information that you provide directly to us, including name, email address, shipping information",
              ),
              const InfoSection(
                title: "Cookie Policy",
                subtitle:
                    "We collect information that you provide directly to us, including name, email address, shipping information",
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Last updated: March 2025",
                style: AppTextstyles.withColor(
                  AppTextstyles.bodySmall,
                  isDark ? Colors.grey[300]!: Colors.grey[700]!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
