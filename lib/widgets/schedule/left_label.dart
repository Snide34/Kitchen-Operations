import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class LeftLabel extends StatelessWidget {
  final String title;
  final String link;

  const LeftLabel({
    super.key,
    required this.title,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 120,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(color: AppColors.borderLight),
          bottom: BorderSide(color: AppColors.borderLight),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            link,
            style: AppTextStyles.greenLink,
          ),
        ],
      ),
    );
  }
}
