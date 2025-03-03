import 'package:e_commerce_modernui/model/product_model.dart';
import 'package:e_commerce_modernui/utils/app_text_styles.dart';
import 'package:e_commerce_modernui/widgets/custom_iconbutton.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
        appBar: AppBar(
          leading: CustomIconbutton(
              icon: Icons.arrow_back_ios,
              onTap: () {
                Navigator.pop(context);
              }),
          title: Text(
            "My Cart",
            style: AppTextstyles.withColor(
                AppTextstyles.h3, isDark ? Colors.white : Colors.black),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return _buildCartItem(context, products[index]);
                  },
                ),
              ),
            ),
            _buildCartSummary(context)
          ],
        ));
  }

  //list of cart product
  Widget _buildCartItem(
    BuildContext context,
    ProductModel product,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.grey.withOpacity(0.1)
                : Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.horizontal(left: Radius.circular(16)),
            child: Image.asset(
              product.imageUrl,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          product.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextstyles.withColor(
                            AppTextstyles.bodyLarge,
                            Theme.of(context).textTheme.bodyLarge!.color!,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _showDeleteComfirmDialog(context);
                        },
                        icon: Icon(
                          Icons.delete_outline,
                          color: Colors.red[400],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "Rs.${product.price}",
                          style: AppTextstyles.withColor(
                              AppTextstyles.h3, Theme.of(context).primaryColor),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.remove,
                                  size: 20,
                                  color: Theme.of(context).primaryColor,
                                )),
                            Text(
                              "1",
                              style: AppTextstyles.withColor(
                                  AppTextstyles.bodyLarge,
                                  Theme.of(context).primaryColor),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add,
                                size: 20,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  //delete confirm dialog box
  void _showDeleteComfirmDialog(BuildContext context) {
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
                  Icons.delete_outline,
                  color: Colors.red[400],
                  size: 32,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Remove Item",
                style: AppTextstyles.withColor(
                  AppTextstyles.h3,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Are you sure you want to remove this item from your cart?",
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
                        "Remove",
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

  //cart summery and checkout

  Widget _buildCartSummary(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 12),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Total (4 Items)",
                style: AppTextstyles.withColor(AppTextstyles.bodyMedium,
                    isDark ? Colors.grey[300]! : Colors.grey[700]!),
              ),
              const Spacer(),
              Text(
                "Rs.97449.0",
                style: AppTextstyles.withColor(
                  AppTextstyles.h3,
                  Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Theme.of(context).primaryColor),
              child: Text(
                "Proceed to Checkout",
                style: AppTextstyles.withColor(
                  AppTextstyles.buttonMedium,
                  Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
