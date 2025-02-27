import 'package:e_commerce_modernui/utils/app_text_styles.dart';
import 'package:e_commerce_modernui/view/forgot%20password/forgot_password_screen.dart';
import 'package:e_commerce_modernui/view/signup/signup_screen.dart';
import 'package:e_commerce_modernui/widgets/custom_textfield.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _handleLogin() {}

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
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Welcome Back",
                  style: AppTextstyles.withColor(AppTextstyles.h1,
                      Theme.of(context).textTheme.bodyLarge!.color!),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Sign in to continue shopping",
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
                  height: 8,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const ForgotPasswordScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Forgot Password?",
                      style: AppTextstyles.withColor(
                        AppTextstyles.buttonMedium,
                        Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),

                //login button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _handleLogin,
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Theme.of(context).primaryColor),
                    child: Text(
                      "Login",
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
                      "Don't have an account?",
                      style: AppTextstyles.withColor(AppTextstyles.bodyMedium,
                          isDark ? Colors.grey[300]! : Colors.grey[700]!),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign up",
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
