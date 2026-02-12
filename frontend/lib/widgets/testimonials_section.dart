import 'package:flutter/material.dart';
import 'common/appointment_button.dart';
import 'common/section_header.dart';
import '../utils/constants.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24),
      color: Colors.grey[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SectionHeader(
            title: 'Hear From People Who\'ve Been There',
            subtitle:
                'At Alta, we\'re honored to walk alongside our clients on their journey to healing and growth. Here\'s what some of them had to say about their experience with our therapists.',
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.format_quote,
                  size: 48,
                  color: AppColors.primary,
                ),
                const SizedBox(height: 18),
                const Text(
                  '"Working with Alta has been transformative. The therapists are compassionate, professional, and truly care about your wellbeing."',
                  style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  '- Sarah J.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 24),
                AppointmentButton(
                  text: 'Find Your Therapist',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
