import 'package:e_commerce_modernui/utils/app_text_styles.dart';
import 'package:e_commerce_modernui/widgets/contact_support_section.dart';
import 'package:e_commerce_modernui/widgets/custom_iconbutton.dart';
import 'package:e_commerce_modernui/widgets/help_category.dart';
import 'package:flutter/material.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
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
          "Help Center",
          style: AppTextstyles.withColor(
            AppTextstyles.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(context),
              const SizedBox(
                height: 16,
              ),
              _popularQuestionSection(
                context,
                "Popular Question",
                [
                  _popularQuestion(context, "How to track my order?", () {
                    _showAddressBottomSheet(
                        context, "How to track my order?", "Ok");
                  }),
                  _popularQuestion(
                    context,
                    "How to return on item?",
                    () {
                      _showAddressBottomSheet(
                          context, "How to return on item?", "Ok");
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Help Category",
                style: AppTextstyles.withColor(
                  AppTextstyles.h3,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              //HelpCategory section
              const HelpCategory(),
              const SizedBox(height: 16,),
              const ContactSupportSection(),
              const SizedBox(height: 12,),
            ],
          ),
        ),
      ),
    );
  }

  //search bar section
  Widget _buildSearchBar(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search for help",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
          prefixIcon: const Icon(Icons.search),
          hintStyle: AppTextstyles.withColor(
            AppTextstyles.bodyMedium,
            isDark ? Colors.grey[300]! : Colors.grey[600]!,
          ),
          filled: true,
          fillColor: Theme.of(context).cardColor,
        ),
      ),
    );
  }

  //build popular question foundation
  Widget _popularQuestionSection(
      BuildContext context, String title, List<Widget> children) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Text(
            title,
            style: AppTextstyles.withColor(
              AppTextstyles.h3,
              Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),
        ),
        ...children
      ],
    );
  }

  //Bild popular question section
  Widget _popularQuestion(
      BuildContext context, String question, VoidCallback onTap) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
      child: ListTile(
        onTap: onTap,
        title: Text(
          question,
          style: AppTextstyles.withColor(
            AppTextstyles.bodyMedium,
            isDark ? Colors.grey[300]! : Colors.grey[900]!,
          ),
        ),
        leading: Icon(
          Icons.fire_truck,
          color: Theme.of(context).primaryColor,
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }

  //show answer
  void _showAddressBottomSheet(
      BuildContext context, String question, String btnName) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    question,
                    style: AppTextstyles.withColor(
                      AppTextstyles.h3,
                      Theme.of(context).textTheme.bodyLarge!.color!,
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
                height: 8,
              ),
              Text(
                _getAnswer(question),
                style: AppTextstyles.withColor(AppTextstyles.bodyMedium,
                    isDark ? Colors.grey[300]! : Colors.grey[700]!),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Theme.of(context).primaryColor),
                  child: Text(
                    "Got it",
                    style: AppTextstyles.withColor(
                        AppTextstyles.buttonMedium, Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getAnswer(String question) {
    final answer = {
      "How to track my order?":
          "To track your order: \n 1. Go to My Orders in your account,\n 2. Select the order you want to track\n 3. Click on Track Order\n 4. You'll see real-time updates about your package location\n  You can also click on the tracking number in your order confirmation email to track your package directly.",
      "How to return on item?":
          "To return an item:\n 1. Go to \"My Orders\" in your account.\n 2. Select the order with the item you want to return. \n 3. Click on \"Return\" Item.\n 4. Select the reason for return\n 5. Print the return label.\n 6. Pack the item securely.\n 7. Drop off the package at the nearest shipping location.\n Returns must be initiated within 30 days of delivery. Once we receive the item, your refund will be processed."
    };

    return answer[question] ??
        "Information not available. Please contact support for assistant";
  }
}
