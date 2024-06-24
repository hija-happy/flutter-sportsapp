import 'package:alvas_sports/bottom_nav_screens/bottom_nav_sports.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'colors.dart'; // Ensure this is your correct import for colors

const List<TabItem> items = [
  TabItem(
    icon: Icons.home,
    title: 'Home',
  ),
  TabItem(
    icon: Icons.sports_golf,
    title: 'Sports',
  ),
  TabItem(
    icon: Icons.add,
    title: 'Register',
  ),
  TabItem(
    icon: Icons.star,
    title: 'Achievements',
  ),
  TabItem(
    icon: Icons.settings,
    title: 'Settings',
  ),
];

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int visit = 0;
  double height = 10;

  final List<Widget> _screens = [
    HomeScreen(),
    NewsFeedPage2(),
    RegisterScreen(),
    AchievementsScreen(),
    // Settings(
    //   userName : 'Hija Happy',
    //   userProfilePic :const AssetImage('assets/man.jpg')
    // ),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 4, 138, 9),
        title: Text("Home"),
      ),
      backgroundColor: Color.lerp(Colors.green, Color.fromARGB(255, 88, 164, 225), 10),
      body: _screens[visit],
      bottomNavigationBar: BottomBarFloating(
        items: items,
        backgroundColor: Color.fromARGB(255, 4, 138, 9),
        colorSelected: Bottom_Nav_Bar_Colors.colorSelect,
        color: Bottom_Nav_Bar_Colors.color,
        indexSelected: visit,
        paddingVertical: 24,
        onTap: (int index) => setState(() {
          visit = index;
        }),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Screen'),
    );
  }
}

class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Sports Screen'),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Register Screen'),
    );
  }
}

class AchievementsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Achievements Screen'),
    );
  }
}


