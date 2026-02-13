import 'package:flutter/material.dart';
import 'package:frontend/utils/constants.dart';
import '../widgets/booking_section.dart';
import '../widgets/events_section.dart';
import '../widgets/faq_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/testimonials_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 60,
            floating: true,
            pinned: true,
            title: const Text(
              'Alta Counseling',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            centerTitle: false,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          SliverToBoxAdapter(
            // this essential to put regular widget like column inside silver
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                HeroSection(),
                EventsSection(),
                BookingSection(),
                FaqSection(),
                TestimonialsSection(),
                // SizedBox(height: 20), // Extra space for bottom nav
              ],
            ),
          ),
        ],
      ),
    );
  }
}
