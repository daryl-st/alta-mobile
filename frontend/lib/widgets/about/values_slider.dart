import 'package:flutter/material.dart';
import '../../models/about.dart';

class ValuesSlider extends StatelessWidget {
  const ValuesSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: About.coreValues.length,
        itemBuilder: (context, index) {
          final value = About.coreValues[index];
          return Container(
            width: 100,
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.all(12),
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
                Icon(
                  _getIconForValue(value.title),
                  color: value.color,
                  size: 28,
                ),
                const SizedBox(height: 8),
                Text(
                  value.title.split(' ').first,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  IconData _getIconForValue(String title) {
    if (title.contains('Quality')) return Icons.star;
    if (title.contains('Integrity')) return Icons.verified;
    if (title.contains('Respect')) return Icons.favorite;
    if (title.contains('Client')) return Icons.support_agent;
    if (title.contains('Confidentiality')) return Icons.lock;
    return Icons.fiber_manual_record;
  }
}
