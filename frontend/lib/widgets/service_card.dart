import 'package:flutter/material.dart';
import '../models/service.dart';
import '../utils/constants.dart';
// import './common/appointment_button.dart';

class ServiceCard extends StatelessWidget {
  final Service service;
  final bool isHighlighted;

  const ServiceCard({
    super.key,
    required this.service,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: isHighlighted
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [service.color.withValues(alpha: 0.1), Colors.white],
              )
            : null,
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: service.color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  _getIconForService(service.name),
                  color: service.color,
                  size: 24,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Text(
                  service.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            service.description,
            style: AppTextStyles.body.copyWith(fontSize: 14, height: 1.5),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(foregroundColor: service.color),
              child: const Text('Book a Session →'),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconForService(String title) {
    if (title.contains('Individual')) return Icons.person_outline;
    if (title.contains('Group')) return Icons.group_outlined;
    if (title.contains('Marriage')) return Icons.favorite_outline;
    if (title.contains('Career')) return Icons.work_outline;
    return Icons.psychology_outlined;
  }
}
