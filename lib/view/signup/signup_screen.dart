import 'package:e_commerce_modernui/utils/app_text_styles.dart';
import 'package:e_commerce_modernui/widgets/custom_iconbutton.dart';
import 'package:e_commerce_modernui/widgets/custom_textfield.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordControler =
      TextEditingController();

  void _handleSignUp() {}

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
                  "Create Account",
                  style: AppTextstyles.withColor(AppTextstyles.h1,
                      Theme.of(context).textTheme.bodyLarge!.color!),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Signup to get started",
                  style: AppTextstyles.withColor(AppTextstyles.bodyLarge,
                      isDark ? Colors.grey[300]! : Colors.grey[700]!),
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextfield(
                  label: "Name",
                  icon: Icons.person_2_outlined,
                  textEditingController: nameController,
                  validator: (value) {
                    if (value == "" || value == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Theme.of(context).primaryColor,
                          content: Text(
                            "Please enter name",
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
                  height: 25,
                ),
                CustomTextfield(
                  label: "Email",
                  icon: Icons.email_outlined,
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
                  height: 25,
                ),
                CustomTextfield(
                  isPassword: true,
                  label: "Password",
                  icon: Icons.lock,
                  textEditingController: passwordController,
                  validator: (value) {
                    if (value == "" || value == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Theme.of(context).primaryColor,
                          content: Text(
                            "Please enter password",
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
                  height: 25,
                ),
                CustomTextfield(
                  isPassword: true,
                  label: "Confirm Password",
                  icon: Icons.lock_outline,
                  textEditingController: confirmPasswordControler,
                  validator: (value) {
                    if (value == "" || value == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Theme.of(context).primaryColor,
                          content: Text(
                            "Please enter password",
                            style: AppTextstyles.withColor(
                              AppTextstyles.withWeight(
                                  AppTextstyles.bodySmall, FontWeight.w500),
                              Colors.white,
                            ),
                          ),
                        ),
                      );
                    } else if (passwordController.text !=
                        confirmPasswordControler.text) {
                      SnackBar(
                        backgroundColor: Theme.of(context).primaryColor,
                        content: Text(
                          "Please enter password",
                          style: AppTextstyles.withColor(
                            AppTextstyles.withWeight(
                                AppTextstyles.bodySmall, FontWeight.w500),
                            Colors.white,
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

                //Sign up button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _handleSignUp,
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Theme.of(context).primaryColor),
                    child: Text(
                      "Sign Up",
                      style: AppTextstyles.withColor(
                          AppTextstyles.buttonMedium, Colors.white),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 24,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: AppTextstyles.withColor(AppTextstyles.bodyMedium,
                          isDark ? Colors.grey[300]! : Colors.grey[700]!),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Login",
                        style: AppTextstyles.withColor(
                          AppTextstyles.bodyLarge,
                          Theme.of(context).primaryColor,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
