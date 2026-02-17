import 'package:flutter/material.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/models/contact.dart';

class ContactHeader extends StatelessWidget {
  const ContactHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primary.withValues(alpha: 0.3), Colors.white],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Let's Connect", style: AppTextStyles.subheadline),
          const SizedBox(height: 8),
          Text(
            Contact.description,
            style: AppTextStyles.body.copyWith(
              color: Colors.grey[700],
              fontSize: 16,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
