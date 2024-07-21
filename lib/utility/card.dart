// category_card.dart
import 'package:flutter/material.dart';

class CategoryCard {
  final String name;
  final String image;
  final VoidCallback onTap;

  CategoryCard({
    required this.name,
    required this.image,
    required this.onTap,
  });

}