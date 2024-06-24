import 'package:flutter/material.dart';

class OnboardingColors {
  // Background colors
  static const Color dark = Color(0xFF0B0B0B);
  static const Color gold = Color(0xFFD3A121);
  static const Color cream = Color(0xFFFAF4E4);
  // Text colors
  static const Color textPrimary = Color(0xFFFAF4E4); // Light text
  static const Color textSecondary = Color(0xFF0B0B0B); // Dark text
  static const Color textAccent = Color(0xFFD3A121); // Accent text
}

class OnboardingTextStyles {
  // Example text styles using the colors defined above
  static const TextStyle heading = TextStyle(
    color: OnboardingColors.textPrimary,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle subheading = TextStyle(
    color: OnboardingColors.textSecondary,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle body = TextStyle(
    color: OnboardingColors.textAccent,
    fontSize: 16,
  );
}

class FullScreenBackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/blue-gradient.jpg"),
          fit: BoxFit.cover, // This makes the image cover the entire screen
        ),
      ),
    );
  }}
  


class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromARGB(255, 2, 38, 67), Color.fromARGB(255, 0, 0, 0)], // Your gradient colors
        ),
      ),
    );
  }
}

  // ignore: camel_case_types
  class Bottom_Nav_Bar_Colors{
 static const Color  colorSelect =  Colors.orange;
 static const Color color =  Color.fromARGB(255, 255, 255, 255);
 static const Color color2 =  Color(0xFFFDF996);
 static const Color bgColor =  Color(0xFFFEF017);
  }