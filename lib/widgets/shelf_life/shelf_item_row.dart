import 'package:flutter/material.dart';
import '../../models/shelf_item.dart';
import '../../core/constants/app_colors.dart';

class ShelfItemRow extends StatelessWidget {
  final ShelfItem item;
  final VoidCallback onDiscountOffer;
  final VoidCallback onRemoveFromWatchlist;

  const ShelfItemRow({
    super.key,
    required this.item,
    required this.onDiscountOffer,
    required this.onRemoveFromWatchlist,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.borderLight),
        ),
      ),
      child: Row(
        children: [
          _buildCell(item.itemId, 80),
          _buildCell(item.itemName, 120),
          _buildCell(item.itemType, 120),
          _buildCell(item.preservationMethod, 140),
          _buildCell(item.storageLocation, 120),
          _buildCell(item.totalQuantity, 140),
          _buildDaysLeftCell(item.daysLeft, 145),
          _buildCell(item.available, 100),
          _buildActionCell(220),
        ],
      ),
    );
  }

  Widget _buildCell(String text, double width) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _buildDaysLeftCell(String text, double width) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Color(0xFFFF3B30),
        ),
      ),
    );
  }

  Widget _buildActionCell(double width) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onDiscountOffer,
              child: Container(
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.darkPill,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Center(
                  child: Text(
                    'Get Discount Offer',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: GestureDetector(
              onTap: onRemoveFromWatchlist,
              child: Container(
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.borderLight),
                ),
                child: const Center(
                  child: Text(
                    'Remove from Watchlist',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
