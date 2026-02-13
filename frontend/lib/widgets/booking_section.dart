import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'common/appointment_button.dart';

class BookingSection extends StatelessWidget {
  const BookingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(24),
      padding: EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
      ),
      child: Column(
        children: [
          const Text(
            'How do I book a session with a therapist?',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          AppointmentButton(text: 'Find your Therapist', onPressed: () {}),
        ],
      ),
    );
  }
}
