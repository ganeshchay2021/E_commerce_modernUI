import 'package:e_commerce_modernui/model/notification_item.dart';

class NotificationRepository {
  static List<NotificationItem> getNotification() {
    return [
      NotificationItem(
        title: "Order Comfirm",
        message: "Your order #123456 has been confirmed is begin processed",
        time: "2 minutes ago",
        type: NotificationType.order,
      ),
      NotificationItem(
        title: "Special Offer!",
        message: "Get 20% off on all shoes this weekned!",
        time: "1 hour ago",
        type: NotificationType.promo,
        isRead: true,
      ),
      NotificationItem(
        title: "Out for Delivery",
        message: "Your order #123456 is out of delivery",
        time: "3 hours ago",
        type: NotificationType.delivery,
      ),
      NotificationItem(
          title: "Payment Successful",
          message: "Payment for order #4456565 was successfull",
          time: "2 minutes ago",
          type: NotificationType.payment,
          isRead: true)
    ];
  }
}
