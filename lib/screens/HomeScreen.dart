// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';  // For Timer

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  // Image URLs and descriptions
  final List<Map<dynamic, dynamic>> _imageData = [
    {'image': 'assets/Home_Image/Slider1.jpg', 'description': 'Sports and Fitness'},
    {'image': 'assets/Home_Image/Slider2.jpg', 'description': 'Description 2'},
    {'image': 'assets/Home_Image/Slider3.jpg', 'description': 'Description 3'},
    {'image': 'assets/Home_Image/Slider4.jpg', 'description': 'Description 4'},
    {'image': 'assets/Home_Image/Slider5.jpg', 'description': 'Description 5'},
  ];

  @override
  void initState() {
    super.initState();
    // Timer to change the page every 6 seconds
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer.periodic(Duration(seconds: 6), (timer) {
        if (_currentIndex < _imageData.length - 1) {
          _currentIndex++;
        } else {
          _currentIndex = 0;
        }
        if (_pageController.hasClients) {
          _pageController.animateToPage(
            _currentIndex,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      });
    });
  }

  void _onTileTap(int index) {
    // Update the index to navigate to the appropriate page
    _pageController.jumpToPage(index + 1); // +1 because 0 is the home page
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          height: 250,  // Adjust the height as needed
          child: PageView.builder(
            itemCount: _imageData.length,
            itemBuilder: (context, index) {
              final item = _imageData[index];
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    item['image']!,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      color: Colors.black54,
                      child: Text(
                        item['description']!,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),

        Expanded(
          child: Container(
            child: Column(
              children: [
                Text("Category"),

                Row(
                  children: [
                    Card(
                      child: Text("Hii"),
                    ),
                    Card(
                      child: Text("Hii"),
                    ),
                  ],
                  ),
                Row(
                  children: [
Card(
                      child: Text("Hii"),
                    ),
                    Card(
                      child: Text("Hii"),
                    ),
                  ],
                  )
                
              ]),
              
           )),
          
        
      ],
    );
  }
}

class Tile extends StatelessWidget {
  final int index;
  final Function(int) onTap;

  Tile({required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Card(
        child: Center(
          child: Text('Item $index'),
        ),
      ),
    );
  }
}

