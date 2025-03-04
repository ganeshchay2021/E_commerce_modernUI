import 'package:e_commerce_modernui/utils/app_text_styles.dart';
import 'package:e_commerce_modernui/utils/assets.dart';
import 'package:e_commerce_modernui/widgets/custom_iconbutton.dart';
import 'package:e_commerce_modernui/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class AccuntEditScreen extends StatefulWidget {
  const AccuntEditScreen({super.key});

  @override
  State<AccuntEditScreen> createState() => _AccuntEditScreenState();
}

class _AccuntEditScreenState extends State<AccuntEditScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

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
          "Edit Profile",
          style: AppTextstyles.withColor(
            AppTextstyles.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 72,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage(Assets.avatar),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        _showImageChooseBottomSheet(context);
                      },
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 36,
              ),
              CustomTextfield(
                  label: "Full Name",
                  icon: Icons.person_outline,
                  textEditingController: _nameController),
              const SizedBox(
                height: 16,
              ),
              CustomTextfield(
                label: "Email",
                icon: Icons.email_outlined,
                textEditingController: _emailController,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextfield(
                label: "Phone Number",
                icon: Icons.phone_outlined,
                textEditingController: _phoneNumberController,
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Theme.of(context).primaryColor),
                  child: Text(
                    "Save Changes",
                    style: AppTextstyles.withColor(
                        AppTextstyles.buttonMedium, Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //image choose bottom sheet
  void _showImageChooseBottomSheet(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showModalBottomSheet(
      isScrollControlled: true,
      showDragHandle: true,
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 12,
              ),
              Text(
                "Change Profile Picture",
                style: AppTextstyles.withColor(
                  AppTextstyles.h3,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.camera_alt_outlined,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  "Take Photo",
                  style: AppTextstyles.withColor(AppTextstyles.buttonSmall,
                      isDark ? Colors.grey[300]! : Colors.grey[700]!),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                ),
              ),
              ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.photo_outlined,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    "Chose from Gallery",
                    style: AppTextstyles.withColor(AppTextstyles.buttonSmall,
                        isDark ? Colors.grey[300]! : Colors.grey[700]!),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                  )),
            ],
          ),
        );
      },
    );
  }
}
