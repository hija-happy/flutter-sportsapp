import 'package:alvas_sports/onboardingPage/onboardingPage_View.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
   SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
  
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;

  @override
void initState() {
  super.initState();

  // fade in animation after 3 seconds delay
  Future.delayed(Duration(seconds: 2),(){
    setState(() {
      _opacity = 1.0;
    });
  });

  // navigate to next page after 5 seconds
  Future.delayed(Duration(seconds: 5),(){
      Navigator.push(
        context,MaterialPageRoute(builder: (context) => const OnboardingPageView()),
      );
  });

}

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:AnimatedOpacity(
          duration: Duration(seconds: 2),
          opacity: _opacity,
          child: Image.asset('assets/logo.png'),
        ),
      ),
    );
  }
}
