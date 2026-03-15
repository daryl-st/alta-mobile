import 'package:flutter/material.dart';
import 'package:frontend/providers/auth_provider.dart';
import 'package:frontend/widgets/common/appointment_button.dart';
import 'package:provider/provider.dart';
import '../widgets/about/about_header.dart';
import '../widgets/about/core_values_grid.dart';
import '../widgets/about/mission_vison_card.dart';
import '../widgets/stat_section.dart';
import '../utils/constants.dart';
import '../models/about.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 40,
            floating: true,
            pinned: true,
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              'About Us',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.share_outlined,
                  color: AppColors.textPrimary,
                ),
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AboutHeader(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: StatSection(),
                ),
                const SizedBox(height: 24),
                const CoreValuesGrid(),
                const SizedBox(height: 24),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      MissionVisonCard(
                        color: AppColors.primary,
                        description: About.mission,
                        icon: Icons.rocket_launch_outlined,
                        title: 'Our Mission',
                      ),
                      const SizedBox(height: 16),
                      MissionVisonCard(
                        color: Colors.orange,
                        description: About.vision,
                        icon: Icons.remove_red_eye_outlined,
                        title: 'Our Vision',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Ready to start your journey?',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 12),
                        AppointmentButton(
                          text: 'Find a Therapist',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                // const SizedBox(height: 10),
                // temporary logout button
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Builder(
                    builder: (context) {
                      return ElevatedButton(
                        onPressed: () async {
                          await Provider.of<AuthProvider>(
                            context,
                            listen: false,
                          ).logout();
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.secondary,
                        ),
                        child: Text('Logout'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
