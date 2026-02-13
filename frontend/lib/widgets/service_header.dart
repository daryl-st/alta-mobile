import 'package:flutter/material.dart';
import '../utils/constants.dart';
import './stat_section.dart';

class ServiceHeader extends StatelessWidget {
  const ServiceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'ALTA',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Helping You Restore Balance and Wellness.',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Discover compassionate, personalized care tailored to your needs. Our therapists provide a safe, judgment-free space where you can explore your thoughts, feelings, and challenges.',
            style: AppTextStyles.body.copyWith(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 24),
          const StatSection(),
        ],
      ),
    );
  }
}
