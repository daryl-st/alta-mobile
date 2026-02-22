import 'package:flutter/material.dart';
import 'package:frontend/widgets/auth/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [const LoginForm()],
              // Here goes the form
            ),
          ),
        ],
      ),
    );
  }
}
