
import 'package:alvas_sports/utility/colors.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';

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
    title: 'Achivements',
  ),
   TabItem(
    icon: Icons.settings,
    title: 'Settings',
  ),
  
];


class Bottom_Nav_Bar extends StatefulWidget {

  const Bottom_Nav_Bar({Key?key, required this.onTabSelected}) : super(key:key);
  final Function(int) onTabSelected;

  @override
  State<Bottom_Nav_Bar> createState() => _Bottom_Nav_BarState();
}

class _Bottom_Nav_BarState extends State<Bottom_Nav_Bar> {

  int visit=0;
  double height = 10;
  @override
  Widget build(BuildContext context) {
    return BottomBarFloating(
           items: items,
      backgroundColor: Bottom_Nav_Bar_Colors.bgColor , 
      colorSelected: Bottom_Nav_Bar_Colors.colorSelect, 
      color: Bottom_Nav_Bar_Colors.color,
      indexSelected: visit,
          paddingVertical: 24,
          onTap: (int index) => setState(() {
            visit = index;
          }),
     


        );
  }
}