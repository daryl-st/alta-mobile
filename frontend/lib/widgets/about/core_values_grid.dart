import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../models/about.dart';

class CoreValuesGrid extends StatelessWidget {
  const CoreValuesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Core Values",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: About.coreValues.length,
            itemBuilder: (context, index) {
              final value = About.coreValues[index];
              return _CoreValueCard(value: value);
            },
          ),
        ],
      ),
    );
  }
}

class _CoreValueCard extends StatelessWidget {
  final CoreValue value;
  const _CoreValueCard({required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: value.color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              _getIconForValue(value.title),
              color: value.color,
              size: 24,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            value.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconForValue(String title) {
    if (title.contains('Quality')) return Icons.star_outline;
    if (title.contains('Integrity')) return Icons.verified_outlined;
    if (title.contains('Respect')) return Icons.favorite_outline;
    if (title.contains('Client')) return Icons.support_agent_outlined;
    if (title.contains('Confidentiality')) return Icons.lock_outline;
    return Icons.fiber_manual_record;
  }
}
