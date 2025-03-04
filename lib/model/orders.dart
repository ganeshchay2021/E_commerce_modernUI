class Orders {
  final String orderNumber;
  final int itemCount;
  final double totalAmount;
  final OrderStatus status;
  final String imageUrl;
  final DateTime orderDate;

  Orders(
      {required this.orderNumber,
      required this.itemCount,
      required this.totalAmount,
      required this.status,
      required this.imageUrl,
      required this.orderDate});

  String get statusString => status.name;
}

enum OrderStatus { active, completed, cancelled }
