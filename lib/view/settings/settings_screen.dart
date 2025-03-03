import 'package:e_commerce_modernui/utils/app_text_styles.dart';
import 'package:e_commerce_modernui/utils/cubit/theme_cubit.dart';
import 'package:e_commerce_modernui/widgets/custom_iconbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
          "Settings",
          style: AppTextstyles.withColor(
            AppTextstyles.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          _buildSection(
            context,
            "Appearance",
            [
              _buildThemeToggle(context),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          _buildSection(
            context,
            "Notifications",
            [
              _buildNotificationSection(context, "Push Noification",
                  "Receive push notification about orders and promotions"),
              const SizedBox(
                height: 8,
              ),
              _buildEmailSection(context, "Email Noification",
                  "Receive email updates about your orders")
            ],
          ),
        ],
      ),
    );
  }

  //build Section
  Widget _buildSection(
      BuildContext context, String title, List<Widget> children) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
          child: Text(
            title,
            style: AppTextstyles.withColor(AppTextstyles.h3,
                isDark ? Colors.grey[300]! : Colors.grey[700]!),
          ),
        ),
        ...children
      ],
    );
  }

  //dark and ligt mode toggle section
  Widget _buildThemeToggle(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: isDark
                    ? Colors.black.withOpacity(0.2)
                    : Colors.grey.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2))
          ],
        ),
        child: ListTile(
          leading: Icon(
            isDark ? Icons.dark_mode : Icons.light_mode,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(
            isDark ? "Dark Mode" : "Light Mode",
            style: AppTextstyles.withColor(
              AppTextstyles.bodyMedium,
              Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),
          trailing: Switch.adaptive(
            inactiveTrackColor: Colors.white,
            activeColor: Theme.of(context).primaryColor,
            value: isDark ? true : false,
            onChanged: (value) {
              context.read<ThemeCubit>().toggle();
            },
          ),
        ),
      ),
    );
  }

  //nofitication section
  Widget _buildNotificationSection(
      BuildContext context, String title, String subtitle) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: isDark
                    ? Colors.black.withOpacity(0.2)
                    : Colors.grey.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2))
          ],
        ),
        child: ListTile(
          title: Text(
            title,
            style: AppTextstyles.withColor(
              AppTextstyles.bodyMedium,
              Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: AppTextstyles.withColor(
              AppTextstyles.bodySmall,
              isDark ? Colors.grey[300]! : Colors.grey[400]!,
            ),
          ),
          trailing: Switch.adaptive(
            inactiveTrackColor: Colors.white,
            activeColor: Theme.of(context).primaryColor,
            value: true,
            onChanged: (value) {
              value = !value;
            },
          ),
        ),
      ),
    );
  }

  //email notification section
  Widget _buildEmailSection(
      BuildContext context, String title, String subtitle) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: isDark
                    ? Colors.black.withOpacity(0.2)
                    : Colors.grey.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2))
          ],
        ),
        child: ListTile(
          title: Text(
            title,
            style: AppTextstyles.withColor(
              AppTextstyles.bodyMedium,
              Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: AppTextstyles.withColor(
              AppTextstyles.bodySmall,
              isDark ? Colors.grey[300]! : Colors.grey[400]!,
            ),
          ),
          trailing: Switch.adaptive(
            inactiveTrackColor: Colors.white,
            activeColor: Theme.of(context).primaryColor,
            value: false,
            onChanged: (value) {
              value = !value;
            },
          ),
        ),
      ),
    );
  }
}
