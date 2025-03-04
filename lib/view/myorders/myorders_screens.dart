import 'package:e_commerce_modernui/model/orders.dart';
import 'package:e_commerce_modernui/repository/order_repository.dart';
import 'package:e_commerce_modernui/utils/app_text_styles.dart';
import 'package:e_commerce_modernui/utils/cubit/theme_cubit.dart';
import 'package:e_commerce_modernui/widgets/custom_iconbutton.dart';
import 'package:e_commerce_modernui/widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrdersScreens extends StatelessWidget {
  final OrderRepository _repository = OrderRepository();
  MyOrdersScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: CustomIconbutton(
            icon: Icons.arrow_back_ios,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "My Orders",
            style: AppTextstyles.withColor(
              AppTextstyles.h3,
              isDark ? Colors.white : Colors.black,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  context.read<ThemeCubit>().toggle();
                },
                icon: const Icon(Icons.dark_mode))
          ],
          bottom: TabBar(
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor:
                  isDark ? Colors.grey[300]! : Colors.grey[700]!,
              indicatorColor: Theme.of(context).primaryColor,
              splashBorderRadius: BorderRadius.circular(10),
              labelStyle: AppTextstyles.buttonMedium,
              tabs: const [
                Tab(
                  text: "Active",
                ),
                Tab(
                  text: "Completed",
                ),
                Tab(
                  text: "Cancelled",
                ),
              ]),
        ),
        body: TabBarView(children: [
          _buildOrderList(context, OrderStatus.active),
          _buildOrderList(context, OrderStatus.completed),
          _buildOrderList(context, OrderStatus.cancelled)
        ]),
      ),
    );
  }

  Widget _buildOrderList(BuildContext context, OrderStatus status) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final order = _repository.getOrdersByStatus(status);
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: order.length,
      itemBuilder: (context, index) {
        final orderItem = order[index];
        return OrderCard(
          orders: orderItem,
          onTap: () {},
        );
      },
    );
  }
}
