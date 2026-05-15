import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class ShelfTableHeader extends StatelessWidget {
  const ShelfTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF5F5F5),
        border: Border(
          bottom: BorderSide(color: AppColors.borderLight),
        ),
      ),
      child: Row(
        children: [
          _buildHeaderCell('Item ID', 80),
          _buildHeaderCell('Item Name', 120),
          _buildHeaderCell('Item Type', 120),
          _buildHeaderCell('Preservation Method', 140),
          _buildHeaderCell('Storage Location', 120),
          _buildHeaderCell('Total Available\nQuantity', 140),
          _buildHeaderCell('Days Left\nTo Shelf Life', 145),
          _buildHeaderCell('Available', 100),
          _buildHeaderCell('Action', 220),
        ],
      ),
    );
  }

  Widget _buildHeaderCell(String text, double width) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}
