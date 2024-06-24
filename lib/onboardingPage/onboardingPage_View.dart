import 'package:alvas_sports/onboardingPage/onboadingPage_Model.dart';
import 'package:alvas_sports/onboardingPage/onboardingPage_Presenter.dart';
import 'package:flutter/material.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingPagePresenter(pages: [
        OnboardingPageModel(
          title: "Upcoming Events & Trainings",
          description: "Stay updated about upcoming sports events and training sessions", 
          bgColor: Color.fromARGB(255, 177, 182, 75),
          imageUrl: "assets/Calendar.png", 
          textColor: Color.fromRGBO(255, 255, 255, 1)
          ),
          OnboardingPageModel(
            title: "Meet the Achievers",
            description: "Discover the stories of top athletes and teams. Get inspired by their journeys, achievements",
            bgColor: Color.fromARGB(255, 56, 232, 59),
            imageUrl: "assets/Achieve.png",
            textColor: Color.fromARGB(255, 255, 255, 255),
          ),
           OnboardingPageModel(
            title: "Discover New Sports",
            description:"Check out different sports and activities. From classics like cricket and kabaddi to niche sports",
            bgColor: Color.fromARGB(255, 33, 68, 211),
            imageUrl: "assets/Athletics.png",
            textColor: Color.fromARGB(255, 255, 255, 255),
          )
      ]),
    );
  }
}