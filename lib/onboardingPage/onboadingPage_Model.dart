import 'package:flutter/material.dart';

class OnboardingPageModel{
  final String title;
  final String description;
  final String imageUrl;
  final Color bgColor;
  final Color textColor;

OnboardingPageModel(
  { required this.title,
    required this.description,
    required this.bgColor,
    required this.imageUrl,
    required this.textColor
  });

}