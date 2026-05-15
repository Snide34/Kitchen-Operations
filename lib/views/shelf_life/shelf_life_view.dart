import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../viewmodels/shelf_life_viewmodel.dart';
import '../../widgets/shelf_life/shelf_table_header.dart';
import '../../widgets/shelf_life/shelf_item_row.dart';
import '../../core/constants/app_colors.dart';

class ShelfLifeView extends GetView<ShelfLifeViewModel> {
  const ShelfLifeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: 1185, // Total width of all columns
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ShelfTableHeader(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Obx(() => Column(
                        children: controller.items.map((item) {
                          return ShelfItemRow(
                            item: item,
                            onDiscountOffer: () => controller.getDiscountOffer(item),
                            onRemoveFromWatchlist: () => controller.removeFromWatchlist(item),
                          );
                        }).toList(),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
