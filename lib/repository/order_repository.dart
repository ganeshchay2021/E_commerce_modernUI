import 'package:e_commerce_modernui/model/orders.dart';
import 'package:e_commerce_modernui/utils/assets.dart';

class OrderRepository {
  List<Orders> getOrders() {
    return [
      Orders(
        orderNumber: "#123456",
        itemCount: 2,
        totalAmount: 25161.00,
        status: OrderStatus.active,
        imageUrl: Assets.shoe,
        orderDate: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      Orders(
        orderNumber: "#316516",
        itemCount: 2,
        totalAmount: 8566.00,
        status: OrderStatus.active,
        imageUrl: Assets.laptop,
        orderDate: DateTime.now().subtract(const Duration(hours: 5)),
      ),
      Orders(
        orderNumber: "#7815651",
        itemCount: 3,
        totalAmount: 65258.00,
        status: OrderStatus.completed,
        imageUrl: Assets.shoe2,
        orderDate: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      Orders(
        orderNumber: "#66262",
        itemCount: 1,
        totalAmount: 6855.00,
        status: OrderStatus.cancelled,
        imageUrl: Assets.shoes2,
        orderDate: DateTime.now().subtract(const Duration(hours: 1)),
      ),
    ];
  }

  List<Orders> getOrdersByStatus(OrderStatus status) {
    return getOrders().where((order) => order.status == status).toList();
  }
}
