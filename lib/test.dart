// import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
// import 'package:flutter/material.dart';

// const List<TabItem> items = [
//   TabItem(
//     icon: Icons.home,
//     title: 'Home',
//   ),
//   TabItem(
//     icon: Icons.search_sharp,
//     title: 'Shop',
//   ),
//   TabItem(
//     icon: Icons.favorite_border,
//     title: 'Wishlist',
//   ),
//   TabItem(
//     icon: Icons.shopping_cart_outlined,
//     title: 'Cart',
//   ),
//   TabItem(
//     icon: Icons.account_box,
//     title: 'profile',
//   ),
// ];




// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       appBar: AppBar(title: Home),
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int visit = 0;
//   double height = 30;
//   Color colorSelect =const Color(0XFF0686F8);
//   Color color = const Color(0XFF7AC0FF);
//   Color color2 = const Color(0XFF96B1FD);
//   Color bgColor = const  Color(0XFF1752FE);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
     
//       body: SingleChildScrollView(
//         padding:const EdgeInsets.symmetric(vertical: 20),
//         child: Column(
//           children: [
           
//           ],
//         ),
//       ),
//       bottomNavigationBar: Container(
        
//         child: BottomBarFloating(
//           items: items,
//           backgroundColor: Color.fromARGB(255, 244, 235, 111),
//           color: Colors.white,
//           colorSelected: Colors.orange,
//           indexSelected: visit,
//           paddingVertical: 24,
//           onTap: (int index) => setState(() {
//             visit = index;
//           }),
//         ),
//       ),
//     );
//   }
// }
