import 'package:flutter/material.dart';

class CoreValue {
  final String title;
  final String iconAsset;
  final Color color;

  const CoreValue({
    required this.title,
    required this.iconAsset,
    required this.color,
  });
}

class About {
  static const String companyName = 'Alta Counseling';
  static const String tagLine = 'Who we are';

  static const String description =
      "Alta Counseling is a compassionate, culturally aware mental health provider dedicated to delivering client-centered, accessible, and evidence-based therapy. Our focus includes individual counseling, family support, and telehealth options, all designed to empower clients on their journey to healing.";

  static const String mission =
      "To nurture and empower individuals, families, and institutions through impactful training, counseling, and research.";

  static const String vision =
      "Expand life skills and counseling services to reach diverse demographics, providing tailored support. Build institutional capacity through training psychologists, social workers, and para-professionals.";

  static List<CoreValue> coreValues = [
    CoreValue(
      title: "Quality & Excellence",
      iconAsset: 'star',
      color: Color(0xFF4CAF50),
    ),
    CoreValue(
      title: "Integrity & Professionalism",
      iconAsset: "verified",
      color: Color(0xFF2196F3),
    ),
    CoreValue(
      title: "Respect & Empathy",
      iconAsset: "favorite",
      color: Color(0xFFE91E63),
    ),
    CoreValue(
      title: "Client Focus & Reliability",
      iconAsset: "support",
      color: Color(0xFFFF9800),
    ),
    CoreValue(
      title: "Confidentiality",
      iconAsset: "lock",
      color: Color(0xFF9C27B0),
    ),
  ];
}
