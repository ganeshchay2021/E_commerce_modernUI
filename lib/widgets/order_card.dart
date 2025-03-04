import 'package:e_commerce_modernui/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce_modernui/model/orders.dart';

class OrderCard extends StatelessWidget {
  final Orders orders;
  final VoidCallback onTap;

  const OrderCard({
    super.key,
    required this.orders,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: isDark ? Colors.grey[200]! : Colors.grey[300]!,
              blurRadius: 8,
              offset: const Offset(0, 1),
            )
          ]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    orders.imageUrl,
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order ${orders.orderNumber}",
                        style: AppTextstyles.withColor(
                          AppTextstyles.h3,
                          Theme.of(context).textTheme.bodyLarge!.color!,
                        ),
                      ),
                      Text(
                        orders.itemCount == 1
                            ? "${orders.itemCount} item. \$${orders.totalAmount}"
                            : "${orders.itemCount} items. \$${orders.totalAmount}",
                        style: AppTextstyles.withColor(
                          AppTextstyles.bodyMedium,
                          isDark ? Colors.grey[300]! : Colors.grey[700]!,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _buildStatusChip(context, orders.status),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 1,
            thickness: 2,
            color: Colors.grey.shade200,
          ),
          InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                "View Details",
                style: AppTextstyles.withColor(
                    AppTextstyles.buttonMedium, Theme.of(context).primaryColor),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStatusChip(BuildContext context, OrderStatus status) {
    Color getOrderStatusColor() {
      switch (status) {
        case OrderStatus.active:
          return Colors.blue;
        case OrderStatus.completed:
          return Colors.green;
        case OrderStatus.cancelled:
          return Colors.red;
        default:
          return Colors.grey;
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
          color: getOrderStatusColor().withOpacity(0.2),
          borderRadius: BorderRadius.circular(16)),
      child: Text(
        status.name.toUpperCase(),
        style: AppTextstyles.withColor(
          AppTextstyles.bodySmall,
          getOrderStatusColor(),
        ),
      ),
    );
  }
}
