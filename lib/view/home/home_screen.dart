import 'package:e_commerce_modernui/utils/app_text_styles.dart';
import 'package:e_commerce_modernui/utils/assets.dart';
import 'package:e_commerce_modernui/view/All%20product/all_product_screen.dart';
import 'package:e_commerce_modernui/widgets/category_chip.dart';
import 'package:e_commerce_modernui/widgets/custom_search_bar.dart';
import 'package:e_commerce_modernui/widgets/product_grid.dart';
import 'package:e_commerce_modernui/widgets/sale_banner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  //user profile
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(Assets.avatar),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //user name and greeting
                      Text(
                        "Hello Ganesh",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "Good Morning",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  //notification icon
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_outlined,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_bag_outlined,
                    ),
                  ),
                ],
              ),
            ),

            //search bar
            const CustomSearchBar(),

            //category chip
            const CategoryChip(),

            //sale Banner
            const SaleBanner(),

            //popular product
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "Popular Products",
                    style: AppTextstyles.withWeight(
                        AppTextstyles.bodyMedium, FontWeight.bold),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const AllProductScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),

            //product grid
            const Expanded(child: ProductGrid())
          ],
        ),
      ),
    );
  }
}
