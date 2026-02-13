import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'common/appointment_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary.withValues(alpha: 0.1),
            Colors.white,
          ], // withValues set the opacity
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your Path to Better Mental Wellness Start Here",
            style: AppTextStyles.headline.copyWith(
              fontSize: 26,
              height: 1.5,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Your Path to Better Mental Wellness Start Here. Your Path to Better Mental Wellness Start Here. Your Path to Better Mental Wellness Start Here. Your Path to Better Mental Wellness Start Here",
            style: AppTextStyles.body.copyWith(
              fontSize: 18,
              // height: 1.2,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              AppointmentButton(text: "Book Appointment", onPressed: () {}),
              const SizedBox(width: 16),
              // AppointmentButton( // No secondary button for now
              //   text: "Explore Services",
              //   onPressed: () {},
              //   isOutlined: true,
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
