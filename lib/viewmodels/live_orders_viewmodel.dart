import 'package:get/get.dart';
import '../models/order_model.dart';

class LiveOrdersViewModel extends GetxController {
  final RxInt subTab = 0.obs;
  
  final RxList<OrderModel> orders = <OrderModel>[
    OrderModel(
      orderId: '10098',
      room: 'A-101',
      status: 'Prepairing',
      timer: '29:38',
      items: [
        OrderItem(name: 'Butter Chicken', quantity: '2 × 500g', assignedTo: 'Rahul K.', status: 'Prepared'),
        OrderItem(name: 'Butter Chicken', quantity: '2 × 500g', assignedTo: 'Rahul K.', status: 'Prepared'),
        OrderItem(name: 'Butter Chicken', quantity: '2 × 500g', assignedTo: null, status: 'Prepared'),
      ],
      isExpanded: true,
    ),
    OrderModel(orderId: '10099', room: 'A-102', status: 'Prepairing', timer: '25:00', items: []),
    OrderModel(orderId: '10100', room: 'B-201', status: 'Prepairing', timer: '15:20', items: []),
    OrderModel(orderId: '10101', room: 'C-305', status: 'Prepairing', timer: '10:45', items: []),
    OrderModel(orderId: '10102', room: 'A-105', status: 'Prepairing', timer: '05:15', items: []),
  ].obs;

  void changeSubTab(int index) => subTab.value = index;

  void toggleOrderExpansion(int index) {
    orders[index].isExpanded = !orders[index].isExpanded;
    orders.refresh();
  }
}
