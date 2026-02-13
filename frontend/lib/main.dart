import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:frontend/utils/constants.dart';
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
      home: MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    Center(child: Text("Service Page", style: TextStyle(fontSize: 24))),
    Center(child: Text("Blog Page", style: TextStyle(fontSize: 24))),
    Center(child: Text("Contact Page", style: TextStyle(fontSize: 24))),
    Center(child: Text("About Page", style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
              backgroundColor: Colors.white.withValues(alpha: 0.9),
              elevation: 8,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.primary,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.psychology_outlined),
                  activeIcon: Icon(Icons.psychology),
                  label: 'Service',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book_outlined),
                  activeIcon: Icon(Icons.menu_book),
                  label: 'Blog',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.contact_mail_outlined),
                  activeIcon: Icon(Icons.contact_mail),
                  label: 'Contact',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.info_outline),
                  activeIcon: Icon(Icons.info),
                  label: 'About',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
