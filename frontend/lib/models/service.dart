import 'package:flutter/material.dart';

class Service {
  final String name;
  final String description;
  final String iconAsset;
  final Color color;
  // final int duration;
  // final int price;
  // final bool isActive;

  const Service({
    required this.name,
    required this.description,
    required this.iconAsset,
    required this.color,
    // this.duration = 60,
    // this.isActive = true,
    // this.price = 15,
  });
}
