import 'package:e_commerce_modernui/utils/app_text_styles.dart';
import 'package:e_commerce_modernui/utils/assets.dart';
import 'package:e_commerce_modernui/view/account/accunt_edit_screen.dart';
import 'package:e_commerce_modernui/view/help%20center/help_center_screen.dart';
import 'package:e_commerce_modernui/view/myorders/myorders_screens.dart';
import 'package:e_commerce_modernui/view/settings/settings_screen.dart';
import 'package:e_commerce_modernui/view/shipping/shipping_address_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Account",
          style: AppTextstyles.withColor(
            AppTextstyles.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildMyProfileSection(context),
            const SizedBox(
              height: 24,
            ),
            _buildMenuSection(context),
          ],
        ),
      ),
    );
  }

  //Profile section
  Widget _buildMyProfileSection(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: isDark ? Colors.grey[850]! : Colors.grey[100]!,
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(24))),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(Assets.avatar),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Ganesh Chaudhary",
            style: AppTextstyles.withColor(
              AppTextstyles.h2,
              Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "ganeshchay2021@gmail.com",
            style: AppTextstyles.withColor(
              AppTextstyles.bodyMedium,
              isDark ? Colors.grey[300]! : Colors.grey[700]!,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const AccuntEditScreen(),
                ),
              );
            },
            style: OutlinedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: Text(
              "Edit Profile",
              style: AppTextstyles.withColor(
                AppTextstyles.buttonMedium,
                Theme.of(context).textTheme.bodyLarge!.color!,
              ),
            ),
          )
        ],
      ),
    );
  }

  //Menu section
  Widget _buildMenuSection(context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final menuItem = [
      {"icon": Icons.shopping_bag_outlined, "title": "My Orders"},
      {"icon": Icons.location_on_outlined, "title": "Shipping Address"},
      {"icon": Icons.help_outline_outlined, "title": "Help Center"},
      {"icon": Icons.logout_outlined, "title": "Logout"},
    ];
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: menuItem.map((menu) {
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
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
                menu["icon"] as IconData,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                menu['title'] as String,
                style: AppTextstyles.withColor(
                  AppTextstyles.bodyMedium,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              trailing: const Icon(
                Icons.chevron_right,
                size: 25,
              ),
              onTap: () {
                if (menu["title"] == "My Orders") {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => MyOrdersScreens(),
                    ),
                  );
                } else if (menu["title"] == "Shipping Address") {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => ShippingAddressScreen(),
                    ),
                  );
                } else if (menu["title"] == "Help Center") {
                  Navigator.push(context, CupertinoPageRoute(builder:(context) => const HelpCenterScreen(),));
                } else if (menu["title"] == "Logout") {
                  _showLogoutComfirmDialog(context);
                }
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  //logout confirm dialog box
  void _showLogoutComfirmDialog(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showDialog(
      barrierColor: Colors.black54,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          contentPadding: const EdgeInsets.all(24),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red[400]!.withOpacity(0.1)),
                child: Icon(
                  Icons.logout,
                  color: Colors.red[400],
                  size: 32,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Logout",
                style: AppTextstyles.withColor(
                  AppTextstyles.h3,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Are you sure you want to logout from app?",
                textAlign: TextAlign.center,
                style: AppTextstyles.withColor(
                  AppTextstyles.bodyMedium,
                  isDark ? Colors.grey[300]! : Colors.grey[700]!,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: Text(
                        "Cancel",
                        style: AppTextstyles.withColor(
                          AppTextstyles.buttonMedium,
                          isDark ? Colors.grey[300]! : Colors.grey[700]!,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          backgroundColor: Theme.of(context).primaryColor),
                      child: Text(
                        "Logout",
                        style: AppTextstyles.withColor(
                            AppTextstyles.buttonMedium, Colors.white),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
