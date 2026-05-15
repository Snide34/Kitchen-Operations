class OrderModel {
  final String orderId;
  final String room;
  final String status;
  final String timer;
  final List<OrderItem> items;
  bool isExpanded;

  OrderModel({
    required this.orderId,
    required this.room,
    required this.status,
    required this.timer,
    required this.items,
    this.isExpanded = false,
  });
}

class OrderItem {
  final String name;
  final String quantity;
  final String? assignedTo;
  final String status;

  OrderItem({
    required this.name,
    required this.quantity,
    this.assignedTo,
    required this.status,
  });
}
