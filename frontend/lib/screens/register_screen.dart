import 'package:flutter/material.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/widgets/auth/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [const RegisterForm()],
              // Here goes the form
            ),
          ),
        ],
      ),
    );
  }
}
