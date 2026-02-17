import 'package:flutter/material.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/widgets/contact/contact_header.dart';
import 'package:frontend/widgets/contact/contact_form.dart';
import 'package:frontend/widgets/contact/contact_methods.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

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
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: ContactHeader(),
                ),

                Container(
                  height: 4,
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primary.withValues(alpha: 0.1),
                        AppColors.primary.withValues(alpha: 0.3),
                        AppColors.primary.withValues(alpha: 0.1),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),

                const SizedBox(height: 12),
                const ContactForm(),

                const ContactMethods(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
