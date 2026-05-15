import 'package:flutter/material.dart';
import '../../models/shift.dart';
import '../../core/constants/app_text_styles.dart';

class ShiftCard extends StatelessWidget {
  final Shift shift;
  const ShiftCard({super.key, required this.shift});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          SizedBox(width: shift.offset),
          Container(
            width: shift.width,
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: shift.backgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Text(
                  shift.duration,
                  style: AppTextStyles.shiftText.copyWith(color: shift.textColor),
                ),
                const Spacer(),
                Text(
                  shift.name,
                  style: AppTextStyles.shiftText.copyWith(color: shift.textColor),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  width: 1,
                  height: 14,
                  color: shift.textColor.withValues(alpha: 0.3),
                ),
                Text(
                  shift.role,
                  style: AppTextStyles.shiftText.copyWith(color: shift.textColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
