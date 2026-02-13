import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../models/service.dart';
import './service_card.dart';

class TopServices extends StatelessWidget {
  final List<Service> services = const [
    Service(
      name: 'Individual Therapy',
      description:
          'Personalized therapy to address anxiety. Personalized therapy to address anxiety. Personalized therapy to address anxiety',
      iconAsset: 'lucy.png',
      color: AppColors.primary,
    ),
    Service(
      name: 'Group Therapy',
      description:
          'Personalized therapy to address anxiety. Personalized therapy to address anxiety. Personalized therapy to address anxiety',
      iconAsset: 'lucy.png',
      color: Colors.orange,
    ),
    Service(
      name: 'Marriage and Family Counseling',
      description:
          'Personalized therapy to address anxiety. Personalized therapy to address anxiety. Personalized therapy to address anxiety',
      iconAsset: 'lucy.png',
      color: Colors.purple,
    ),
    Service(
      name: 'Career Counseling',
      description:
          'Personalized therapy to address anxiety. Personalized therapy to address anxiety. Personalized therapy to address anxiety',
      iconAsset: 'lucy.png',
      color: Colors.blue,
    ),
  ];
  const TopServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Top Services',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Choose from out specialized Therapy',
            style: AppTextStyles.body.copyWith(fontSize: 14),
          ),
          const SizedBox(height: 24),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: services.length,
            itemBuilder: (context, index) {
              return ServiceCard(
                service: services[index],
                isHighlighted: index == 0,
              );
            },
          ),
        ],
      ),
    );
  }
}
