import 'package:flutter/material.dart';

class ContactInfo {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const ContactInfo({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });
}

class Contact {
  static const String tagline = 'YOUR PATH TO WELL-BEING';
  static const String estd = 'ESTD 2013';

  static const String description =
      "We'd love to hear from you! Whether you're booking a session, asking a question, or just checking in—fill out the form below, and we'll get back to you within one business day.";

  static const String helpCenter = "Help Center";

  static List<ContactInfo> contactMethods = [
    ContactInfo(
      title: "Email",
      value: "hello@altacounseling.com",
      icon: Icons.email_outlined,
      color: Color(0xFF4CAF50),
    ),
    ContactInfo(
      title: "Phone",
      value: "+1 (555) 123-4567",
      icon: Icons.phone_outlined,
      color: Color(0xFF2196F3),
    ),
    ContactInfo(
      title: "Office",
      value: "123 Wellness St, Suite 100",
      icon: Icons.location_on_outlined,
      color: Color(0xFFFF9800),
    ),
    ContactInfo(
      title: "Hours",
      value: "Mon-Fri: 9am - 7pm",
      icon: Icons.access_time_outlined,
      color: Color(0xFF9C27B0),
    ),
  ];
}
