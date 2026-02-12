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
            expandedHeight: 100,
            floating: true,
            pinned: true,
            title: const Text(
              'Alta',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            centerTitle: false,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                HeroSection(),
                EventsSection(),
                BookingSection(),
                TestimonialsSection(),
                FaqSection(),
                SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
