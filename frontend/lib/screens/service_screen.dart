import 'package:flutter/material.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/widgets/workshop_card.dart';
import '../widgets/top_services.dart';
import '../widgets/service_header.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

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
              'Services',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            centerTitle: false,
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_outlined),
              ),
            ],
          ),
          SliverToBoxAdapter(
            // this essential to put regular widget like column inside silver
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                ServiceHeader(),
                TopServices(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: WorkshopCard(),
                ),
                SizedBox(height: 24),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Featured Workshops',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Add more workshops cards or horizontal list
                // SizedBox(height: 20), // Extra space for bottom nav
              ],
            ),
          ),
        ],
      ),
    );
  }
}
