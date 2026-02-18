import 'package:flutter/material.dart';

class WasteCategory {
  final String name;
  final Color color;
  final IconData icon;

  const WasteCategory({
    required this.name,
    required this.color,
    required this.icon,
  });
}

class MissionItem {
  final String title;
  final String description;
  final String imageUrl;

  const MissionItem({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

class WasteShort {
  final String title;
  final String imageUrl;

  const WasteShort({required this.title, required this.imageUrl});
}
