import 'package:flutter/material.dart';
// import './presentation/screens/auth/login.dart';
// import './presentation/screens/auth/signup.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const AltaApp());
}

class AltaApp extends StatelessWidget {
  const AltaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alta - Mental Welness',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors
            .teal, // this is replaced by colorScheme: material3. we will work on it on the next project
        fontFamily: 'Inter',
        scaffoldBackgroundColor: Colors.grey[50],
      ),
      home: HomeScreen(),
    );
  }
}
