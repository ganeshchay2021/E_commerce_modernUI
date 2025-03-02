import 'package:e_commerce_modernui/widgets/custom_iconbutton.dart';
import 'package:flutter/material.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomIconbutton(icon: Icons.arrow_back_ios, onTap: () {}),
      ),
    );
  }
}
