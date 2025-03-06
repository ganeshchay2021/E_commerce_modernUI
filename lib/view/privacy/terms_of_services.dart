import 'package:e_commerce_modernui/utils/app_text_styles.dart';
import 'package:e_commerce_modernui/widgets/custom_iconbutton.dart';
import 'package:e_commerce_modernui/widgets/info_section.dart';
import 'package:flutter/material.dart';

class TermsOfServices extends StatelessWidget {
  const TermsOfServices({super.key});

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
          "Terms of Services",
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
            children: [
              const InfoSection(
                title: "Welcome To Fashion Store",
                subtitle:
                    "By accessing and using this application, you accept and agree to be bound by the terms and provision of this aggrement.",
              ),
              const InfoSection(
                title: "Account Registration",
                subtitle:
                    "By accessing and using this application, you accept and agree to be bound by the terms and provision of this aggrement.",
              ),
              const InfoSection(
                title: "User Responsibility",
                subtitle:
                    "By accessing and using this application, you accept and agree to be bound by the terms and provision of this aggrement.",
              ),
              const InfoSection(
                title: "Privacy Policy",
                subtitle:
                    "By accessing and using this application, you accept and agree to be bound by the terms and provision of this aggrement.",
              ),
              const InfoSection(
                title: "Intellectual Property",
                subtitle:
                    "By accessing and using this application, you accept and agree to be bound by the terms and provision of this aggrement.",
              ),
              const InfoSection(
                title: "Termination",
                subtitle:
                    "By accessing and using this application, you accept and agree to be bound by the terms and provision of this aggrement.",
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Last updated: March 2025",
                style: AppTextstyles.withColor(
                  AppTextstyles.bodySmall,
                  isDark ? Colors.grey[300]! : Colors.grey[700]!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
