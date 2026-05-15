import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class TimelineHeader extends StatelessWidget {
  final List<String> hours;
  const TimelineHeader({super.key, required this.hours});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            Container(
              width: 70,
              height: 48,
              margin: const EdgeInsets.only(right: 2),
              decoration: BoxDecoration(
                color: AppColors.darkPill,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '06:43',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      height: 1.1,
                    ),
                  ),
                  Text(
                    'AM',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      height: 1.1,
                    ),
                  ),
                ],
              ),
            ),
            ...hours.skip(1).map((h) => SizedBox(
              width: 70,
              child: Center(
                child: Text(
                  h,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
