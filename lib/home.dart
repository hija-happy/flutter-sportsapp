import 'package:alvas_sports/bottom_nav_screens/bottom_nav_register.dart';
import 'package:alvas_sports/bottom_nav_screens/bottom_nav_settings.dart';
import 'package:alvas_sports/bottom_nav_screens/bottom_nav_sports.dart';
import 'package:alvas_sports/drawer_screens/about_us.dart';
import 'package:alvas_sports/drawer_screens/calander.dart';
import 'package:alvas_sports/screens/HomeScreen.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'utility/colors.dart';

const List<TabItem> items = [
  TabItem(
    icon: LineAwesomeIcons.home_solid,
    title: 'Home',
  ),
  TabItem(
    icon: LineAwesomeIcons.newspaper,
    title: 'News',
  ),
  TabItem(
    icon: LineAwesomeIcons.plus_solid,
    title: 'Register',
  ),
  TabItem(
    icon: LineAwesomeIcons.trophy_solid,
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

  final List<Widget> _screens = [
    HomePage(),
    NewsFeedPage2(),
    RegistrationForm(),
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Calander()))       ;       },
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
                Navigator.push(context,MaterialPageRoute(builder: (context)=> SettingsScreen()));
               
              },
            ),
          
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About Us'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AboutUsPage()));
              
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



class AchievementsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Achievements Screen'),
    );
  }
}

//https://alvascollege.com/achievements-2/sports/