import 'package:e_commerce_modernui/utils/app_text_styles.dart';
import 'package:e_commerce_modernui/widgets/custom_iconbutton.dart';
import 'package:e_commerce_modernui/widgets/custom_textfield.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomIconbutton(
                    icon: Icons.arrow_back_ios,
                    onTap: () {
                      Navigator.pop(context);
                    }),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Reset Password",
                  style: AppTextstyles.withColor(AppTextstyles.h1,
                      Theme.of(context).textTheme.bodyLarge!.color!),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Enter your email to reset your password",
                  style: AppTextstyles.withColor(AppTextstyles.bodyLarge,
                      isDark ? Colors.grey[300]! : Colors.grey[700]!),
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextfield(
                  label: "Email",
                  icon: Icons.email,
                  textEditingController: emailController,
                  validator: (value) {
                    if (value == "" || value == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Theme.of(context).primaryColor,
                          content: Text(
                            "Please enter Email",
                            style: AppTextstyles.withColor(
                              AppTextstyles.withWeight(
                                  AppTextstyles.bodySmall, FontWeight.w500),
                              Colors.white,
                            ),
                          ),
                        ),
                      );
                    } else if (EmailValidator.validate(value.toString())) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Theme.of(context).primaryColor,
                          content: Text(
                            "Please enter valid email",
                            style: AppTextstyles.withColor(
                              AppTextstyles.withWeight(
                                  AppTextstyles.bodySmall, FontWeight.w500),
                              Colors.white,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),

                //login button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      showSuccessDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Theme.of(context).primaryColor),
                    child: Text(
                      "Send Reset Link",
                      style: AppTextstyles.withColor(
                          AppTextstyles.buttonMedium, Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Check your email',
            style: AppTextstyles.h3,
          ),
          content: Text(
            "We have send a password recovery instructions to your email",
            style: AppTextstyles.bodyMedium,
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Ok',
                style: AppTextstyles.withColor(
                    AppTextstyles.bodyMedium, Theme.of(context).primaryColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
