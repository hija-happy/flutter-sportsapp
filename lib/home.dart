import 'package:alvas_sports/bottom_nav_screens/bottom_nav_settings.dart';
import 'package:alvas_sports/bottom_nav_screens/bottom_nav_sports.dart';
import 'package:alvas_sports/screens/HomeScreen.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'colors.dart'; // Ensure this is your correct import for colors

const List<TabItem> items = [
  TabItem(
    icon: LineAwesomeIcons.home_solid,  // Direct IconData
    title: 'Home',
  ),
  TabItem(
    icon: LineAwesomeIcons.newspaper,  // Direct IconData
    title: 'News',
  ),
  TabItem(
    icon: LineAwesomeIcons.plus_solid,  // Direct IconData
    title: 'Register',
  ),
  TabItem(
    icon: LineAwesomeIcons.trophy_solid,  // Direct IconData
    title: 'Achievements',
  ),
  TabItem(
    icon: Icons.settings,  // Direct IconData
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

  final List<Widget> _screens = [
    HomePage(),
    NewsFeedPage2(),
    RegisterScreen(),
    AchievementsScreen(),
    SettingsScreen(),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 2, 67, 4),
        title: Text(
          "Home",
          style: TextStyle(color: FontColor.appbarColour),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle_rounded),
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  visit = 0;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_month),
              title: Text('Calendar'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  visit = 1;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Circular'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  visit = 2;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  visit = 3;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  visit = 4;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About Us'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  visit = 4;
                });
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: _screens[visit],
      bottomNavigationBar: BottomBarFloating(
        items: items,
        backgroundColor: Bottom_Nav_Bar_Colors.bgColor,
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
