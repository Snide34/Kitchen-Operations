import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../models/buffet_slot.dart';

class BuffetSlotWidget extends StatelessWidget {
  final BuffetSlot slot;
  final double width;

  const BuffetSlotWidget({
    super.key,
    required this.slot,
    this.width = 140,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      constraints: const BoxConstraints(minHeight: 120),
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(color: AppColors.borderLight),
          bottom: BorderSide(color: AppColors.borderLight),
        ),
      ),
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    if (slot.isNA) {
      return const Center(
        child: Text(
          'N/A',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
          ),
        ),
      );
    }

    if (slot.title != null && slot.eventName == null && slot.label == null) {
      return Center(
        child: Text(
          slot.title!,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (slot.title != null) ...[
          Text(
            slot.title!,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
        ],
        if (slot.eventName != null) ...[
          Text(
            slot.eventName!,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
        ],
        if (slot.label != null)
          Text(
            slot.label!,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
            ),
          ),
        if (slot.time != null)
          Text(
            slot.time!,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
        if (slot.link != null) ...[
          const SizedBox(height: 4),
          Text(
            slot.link!,
            style: AppTextStyles.greenLink,
          ),
        ],
      ],
    );
  }
}
