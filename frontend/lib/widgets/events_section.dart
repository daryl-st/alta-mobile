import 'package:flutter/material.dart';
import '../models/event.dart';
import 'common/section_header.dart';
import '../utils/constants.dart';

class EventsSection extends StatelessWidget {
  final List<Event> events = const [
    Event(
      title: 'Conference Dinner',
      date: 'May 12-24, 2025',
      location: 'Office',
      description:
          'Join our bi-weekly guided meditation group. Open to all levels, this session focuses on breath work, mindfulness, and emotional grounding.',
    ),
    Event(
      title: 'Conference Dinner',
      date: 'May 19 | 5 Full Days',
      location: 'Office',
      description:
          'Join our bi-weekly guided meditation group. Open to all levels, this session focuses on breath work, mindfulness, and emotional grounding.',
    ),
    Event(
      title: 'Basic Counseling Skill Training',
      date: 'May 19 | 5 Full Days',
      location: 'Virtual',
      description:
          'Comprehensive training program for basic counseling skills. Open to all levels, this session focuses on breath work, mindfulness, and emotional grounding.',
    ),
  ];
  const EventsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SectionHeader(
            title: 'Upcoming Events',
            subtitle:
                'Stay informed about our latest workshops, group sessions, and wellness retreats. All events are designed to support your mental health journey in a safe, supportive environment.',
          ),
          const SizedBox(height: 32),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _EventCard(event: events[index]);
            },
            separatorBuilder: (_, __) => const SizedBox(height: 24),
            itemCount: events.length,
          ),
        ],
      ),
    );
  }
}

class _EventCard extends StatelessWidget {
  final Event event;
  const _EventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  event.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  event.date,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            event.location,
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Text(event.description, style: AppTextStyles.body),
        ],
      ),
    );
  }
}
