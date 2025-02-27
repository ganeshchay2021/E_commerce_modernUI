// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_modernui/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  final String label;
  final IconData icon;
  final TextInputType keyBoardType;
  final bool isPassword;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final void Function(String)? onChange;

  const CustomTextfield({
    super.key,
    required this.label,
    required this.icon,
    this.keyBoardType = TextInputType.text,
    this.isPassword = false,
    required this.textEditingController,
    this.validator,
    this.onChange,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return TextFormField(
      controller: widget.textEditingController,
      obscureText: showPassword,
      keyboardType: widget.keyBoardType,
      validator: widget.validator,
      onChanged: widget.onChange,
      style: AppTextstyles.withColor(
        AppTextstyles.bodyMedium,
        Theme.of(context).textTheme.bodyLarge!.color!,
      ),
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: AppTextstyles.withColor(
          AppTextstyles.bodyMedium,
          isDark ? Colors.grey[300]! : Colors.grey[700]!,
        ),
        prefixIcon: Icon(
          widget.icon,
          color: isDark ? Colors.grey[300]! : Colors.grey[700]!,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(
                    () {
                      showPassword = !showPassword;
                    },
                  );
                },
                icon: Icon(
                  showPassword ? Icons.visibility_off : Icons.visibility,
                  color: isDark ? Colors.grey[300]! : Colors.grey[700]!,
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(color: isDark ? Colors.grey[300]! : Colors.grey[700]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(color: isDark ? Colors.grey[300]! : Colors.grey[700]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.error),
        ),
         focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.error),
        ),
      ),
    );
  }
}
