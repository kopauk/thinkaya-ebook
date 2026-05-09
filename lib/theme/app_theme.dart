import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF4DD9D5);
  static const primaryDark = Color(0xFF00BCD4);
  static const accent = Color(0xFFFF6B6B);
  static const teal = Color(0xFF008080);
  static const background = Colors.white;
  static const surface = Color(0xFFF5F5F5);
  static const textPrimary = Color(0xFF1A1A1A);
  static const textSecondary = Color(0xFF757575);
  static const star = Color(0xFFFFC107);
  static const progressBg = Color(0xFFE0E0E0);
  static const bannerBg = Color(0xFFF5D88E);
  static const cardBg = Color(0xFFF8F8F8);
}

class AppTextStyles {
  static const heading1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const heading2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const heading3 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const body = TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary,
  );

  static const caption = TextStyle(
    fontSize: 12,
    color: AppColors.textSecondary,
  );
}
