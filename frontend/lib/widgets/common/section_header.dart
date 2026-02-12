import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;

  const SectionHeader({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.subheadline),
        if (subtitle != null) ...[
          const SizedBox(height: 12),
          Text(subtitle!, style: AppTextStyles.body),
        ],
      ],
    );
  }
}
