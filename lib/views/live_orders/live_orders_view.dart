import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../viewmodels/live_orders_viewmodel.dart';
import '../../models/order_model.dart';

class LiveOrdersView extends GetView<LiveOrdersViewModel> {
  const LiveOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSubTabs(),
        Expanded(
          child: Obx(() => ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: controller.orders.length,
            itemBuilder: (context, index) => _buildOrderCard(controller.orders[index], index),
          )),
        ),
      ],
    );
  }

  Widget _buildSubTabs() {
    return Obx(() => Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(child: _buildSubTab('Runing Orders', 0)),
              Expanded(child: _buildSubTab('Ala Carte Menu', 1)),
            ],
          ),
        ),
        const Divider(height: 1, color: AppColors.borderLight),
      ],
    ));
  }

  Widget _buildSubTab(String label, int index) {
    final isActive = controller.subTab.value == index;
    return GestureDetector(
      onTap: () => controller.changeSubTab(index),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              label,
              style: isActive ? AppTextStyles.tabInactive.copyWith(fontWeight: FontWeight.w700) : AppTextStyles.tabInactive.copyWith(color: AppColors.textSecondary),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: 2,
            color: isActive ? AppColors.textPrimary : Colors.transparent,
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard(OrderModel order, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.borderLight),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              _buildInfoColumn('Order Id', order.orderId),
              _buildInfoColumn('Room', order.room),
              _buildInfoColumn('Order Status', order.status),
              _buildInfoColumn('Timer', order.timer),
              IconButton(
                icon: Icon(
                  order.isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: AppColors.textSecondary,
                ),
                onPressed: () => controller.toggleOrderExpansion(index),
              ),
            ],
          ),
          if (order.isExpanded && order.items.isNotEmpty) ...[
            const Divider(height: 32),
            _buildItemsTable(order.items),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.cancelRed),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text('Cancel All', style: TextStyle(color: AppColors.cancelRed, fontWeight: FontWeight.w600, fontSize: 15)),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
        ],
      ),
    );
  }

  Widget _buildItemsTable(List<OrderItem> items) {
    return Column(
      children: [
        Row(
          children: const [
            Expanded(flex: 3, child: Text('Item Name', style: TextStyle(fontSize: 11, color: AppColors.textSecondary))),
            Expanded(flex: 2, child: Text('Quantity', style: TextStyle(fontSize: 11, color: AppColors.textSecondary))),
            Expanded(flex: 2, child: Text('Assigned', style: TextStyle(fontSize: 11, color: AppColors.textSecondary))),
            SizedBox(width: 100), // Space for Cancel button
          ],
        ),
        const Divider(height: 16),
        ...items.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              Expanded(flex: 3, child: Text(item.name, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.textPrimary))),
              Expanded(flex: 2, child: Text(item.quantity, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.textPrimary))),
              Expanded(
                flex: 2,
                child: item.assignedTo != null
                    ? Text(item.assignedTo!, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.textPrimary))
                    : Text('Assign', style: AppTextStyles.greenLink.copyWith(fontSize: 15)),
              ),
              SizedBox(
                width: 100,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.cancelRed),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  child: const Text('Cancel', style: TextStyle(color: AppColors.cancelRed, fontWeight: FontWeight.w600, fontSize: 13)),
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }
}
