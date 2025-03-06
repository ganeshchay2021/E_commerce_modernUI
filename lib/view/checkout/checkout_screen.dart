import 'package:e_commerce_modernui/repository/shipping_address_repository.dart';
import 'package:e_commerce_modernui/utils/app_text_styles.dart';
import 'package:e_commerce_modernui/utils/assets.dart';
import 'package:e_commerce_modernui/widgets/custom_iconbutton.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  final ShippingAddressRepository _repository = ShippingAddressRepository();
  CheckoutScreen({super.key});

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
          "Checkout",
          style: AppTextstyles.withColor(
            AppTextstyles.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          _buildSection(
            context,
            "Shipping Address",
            [
              _buildShippingAddressSection(
                context,
                _repository.getDefaultAddress()!.label,
                _repository.getDefaultAddress()!.fullAddress,
                Icons.location_on_outlined,
                Icons.edit_outlined,
              )
            ],
          ),
          _buildSection(
            context,
            "Payment Method",
            [
              _buildPaymentSection(
                context,
                "Visa Ending in 4242",
                "Expire 12/24f",
                Assets.mastercard,
                Icons.edit_outlined,
              )
            ],
          ),
          _buildSection(
            context,
            "Order Summary",
            [
              _orderSummary(context),
            ],
          ),
          
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:  Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Navigator
              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  backgroundColor: Theme.of(context).primaryColor),
              child: Text(
                "Place order (Rs. 622.10)",
                style: AppTextstyles.withColor(
                  AppTextstyles.buttonMedium,
                  Colors.white,
                ),
              ),
            ),
          ),
    );
  }

  //build Section
  Widget _buildSection(
      BuildContext context, String title, List<Widget> children) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
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

  //shiping address section
  Widget _buildShippingAddressSection(BuildContext context, String title,
      String subtitle, IconData? leadingIcon, IconData trailingIcon) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Container(
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
            leadingIcon,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(
            title,
            style: AppTextstyles.withColor(
              AppTextstyles.buttonMedium,
              Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: AppTextstyles.withColor(
              AppTextstyles.bodySmall,
              isDark ? Colors.grey[300]! : Colors.grey[600]!,
            ),
          ),
          trailing: Icon(
            trailingIcon,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }

  //payment method section
  Widget _buildPaymentSection(BuildContext context, String title,
      String subtitle, String image, IconData trailingIcon) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Container(
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
          leading: Container(
            padding: const EdgeInsets.all(8),
            height: 40,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8)),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            title,
            style: AppTextstyles.withColor(
              AppTextstyles.buttonMedium,
              Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: AppTextstyles.withColor(
              AppTextstyles.bodySmall,
              isDark ? Colors.grey[300]! : Colors.grey[600]!,
            ),
          ),
          trailing: Icon(
            trailingIcon,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }

  //order summary
  Widget _orderSummary(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
          child: Column(
            children: [
              _summary(context, "Subtotal", "Rs. 599.93"),
              _summary(context, "Shipping", "Rs. 10.00"),
              _summary(context, "Tax", "Rs. 53.00"),
              Divider(
                thickness: 1,
                height: 20,
                color: isDark ? Colors.grey[100]! : Colors.grey[400],
              ),
              _summary(
                context,
                "Total",
                "Rs. 622.10",
                isTotal: true,
              ),
            ],
          )),
    );
  }

  Widget _summary(BuildContext context, String title, String price,
      {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextstyles.withColor(
              AppTextstyles.buttonMedium,
              isTotal
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),
          Text(
            price,
            style: AppTextstyles.withColor(
              AppTextstyles.buttonMedium,
              isTotal
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),
        ],
      ),
    );
  }
}
