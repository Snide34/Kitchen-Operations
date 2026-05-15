import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

enum ShiftType { green, yellow }

class Shift {
  final String duration;
  final String name;
  final String role;
  final ShiftType type;
  final double width;
  final double offset;

  const Shift({
    required this.duration,
    required this.name,
    required this.role,
    required this.type,
    required this.width,
    required this.offset,
  });

  Color get backgroundColor => type == ShiftType.green ? AppColors.shiftGreenBg : AppColors.shiftYellowBg;
  Color get textColor => type == ShiftType.green ? AppColors.shiftGreenText : AppColors.shiftYellowText;
}
