import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF008080);
  static const Color primaryLight = Color(0xFF4DB6AC);
  static const Color secondary = Color(0xFFF5F5F5);
  static const Color textPrimary = Color(0xFF2D3E50);
  static const Color textSecondary = Color(0xFF6B7B8A);
  static const Color accent = Color(0xFFFFA726);
}

class AppTextStyles {
  static const String fontFamily = 'Inter';

  static const TextStyle headline = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
    fontFamily: fontFamily,
  );

  static const TextStyle subheadline = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    fontFamily: fontFamily,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    color: AppColors.textSecondary,
    fontFamily: fontFamily,
    height: 1.5,
  );
}
