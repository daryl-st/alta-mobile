import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'common/section_header.dart';

class FaqSection extends StatelessWidget {
  const FaqSection({super.key});

  final List<Map<String, String>> faqs = const [
    {
      'question': 'What is Alta and how does it work?',
      'answer': 'Add more content here',
    },
    {'question': 'Is therapy right for me?', 'answer': 'Add more content here'},
    {
      'question': 'What types of therapy does Alta offer?',
      'answer': 'Add more content here',
    },
    {
      'question': 'How do I book a session with a therapist?',
      'answer': 'Add more content here',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: 'Frequently Asked Questions',
            subtitle:
                'Have questions? We\'ve got answers. Here are some of the most common questions people ask about Alta. If you don\'t find what you\'re looking for, feel free to reach out — we\'re happy to help.',
          ),
          const SizedBox(height: 12),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ExpansionTile(
                tilePadding: EdgeInsets.zero,
                title: Text(
                  faqs[index]['question']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsetsGeometry.symmetric(vertical: 16),
                      child: Text(
                        faqs[index]['answer']!,
                        style: AppTextStyles.body,
                      ),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (_, __) => Divider(),
            itemCount: faqs.length,
          ),
        ],
      ),
    );
  }
}
