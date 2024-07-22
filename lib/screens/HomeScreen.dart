// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';  // For Timer

import 'package:alvas_sports/utility/card.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
    {'image': 'assets/Home_Image/Slider2.jpg', 'description': 'Victory on the Field'},
    {'image': 'assets/Home_Image/Slider3.jpg', 'description': 'Game On'},
    {'image': 'assets/Home_Image/Slider4.jpg', 'description': 'Sweat More, Gain More'},
    {'image': 'assets/Home_Image/Slider5.jpg', 'description': 'Win Always'},
  ];

  @override
  void initState() {
    super.initState();
    // Timer to change the page every 6 seconds
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer.periodic(Duration(seconds: 4), (timer) {
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


final List<CategoryCard> categories = [
      CategoryCard(
        name: 'Cricket',
        image: 'assets/category/cricket.jpg',
       onTap: () async {
  final Uri url = Uri.parse('https://olympics.com/en/news/cricket-sport-rules-players-origins-things-to-know');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
},
      ),
      CategoryCard(
        name: 'FootBall',
        image: 'assets/category/football.jpg',
      onTap: () async {
  final Uri url = Uri.parse('https://olympics.com/en/news/how-to-play-football-rules-field-pitch-free-kick-penalty?utm_source=google&utm_medium=paid-media&utm_campaign=google_cpc_in_bau-search-2024_hybrid_english&utm_content=google_cpc_in_bau-search-2024_hybrid_en_pmax_na_generic_na&gad_source=1&gclid=EAIaIQobChMI3qC6yPS5hwMVaaNmAh33IATtEAAYASAAEgLOp_D_BwE&gclsrc=aw.ds');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
},
      ),
      CategoryCard(
        name: 'HandBall',
        image: 'assets/category/handball.jpg',
       onTap: () async {
  final Uri url = Uri.parse('https://olympics.com/en/news/handball-game-rules-regulations-how-to-play');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
},
      ),
      CategoryCard(
        name: 'Kabbadi',
        image: 'assets/category/kabbadi.jpg',
        onTap: () async {
  final Uri url = Uri.parse('https://olympics.com/en/news/kabaddi-rules-regulations-how-to-play');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
},
      ),
      CategoryCard(
        name: 'Kho - Kho',
        //
        image: 'assets/category/kho-kho.jpeg',
        onTap: () async {
  final Uri url = Uri.parse('https://www.sportzyogi.com/kho-kho-rules-and-regulation/');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
},
      ),
      CategoryCard(
        name: 'Tennis',
        image: 'assets/category/tennis.jpg',
       onTap: () async {
  final Uri url = Uri.parse('https://olympics.com/en/news/tennis-rules-regulations-how-to-play-basics?utm_source=google&utm_medium=paid-media&utm_campaign=google_cpc_in_bau-search-2024_hybrid_english&utm_content=google_cpc_in_bau-search-2024_hybrid_en_pmax_na_generic_na&gad_source=1&gclid=EAIaIQobChMIwYaC9_S5hwMVTCuDAx1qwAdZEAAYASAAEgJdofD_BwE&gclsrc=aw.ds');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
},
      ),
      CategoryCard(
        name: 'VolleyBall',
        image: 'assets/category/volleyball.png',
       onTap: () async {
  final Uri url = Uri.parse('https://olympics.com/en/news/how-to-play-volleyball-rules-game-court-about-match-set-smash-spike');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
},
      ),
      CategoryCard(
        name: 'Weight Lifting',
        image: 'assets/category/weight.jpg',
      onTap: () async {
  final Uri url = Uri.parse('https://www.nbcolympics.com/news/weightlifting-101-olympic-rules-violations-and-competition-format#:~:text=Olympic%20competition%20format&text=Athletes%20have%20just%20three%20attempts,combined%20total%20is%20the%20winner.');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
},
      ),
      CategoryCard(
        name: 'Wrestling',
        image: 'assets/category/wresting.jpg',
       onTap: () async {
  final Uri url = Uri.parse('https://olympics.com/en/news/what-how-freestyle-wrestling-style-rules-scoring-techniques-olympics');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
},
      ),
    ];

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

                    Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return GestureDetector(
                  onTap: category.onTap,
                  child: Card(
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            category.image,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            category.name,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
               
                
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





class DetailFootballPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Football Details'),
      ),
      body: Center(
        child: Text(
          'Detailed information about Football.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class DetailBasketballPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basketball Details'),
      ),
      body: Center(
        child: Text(
          'Detailed information about Basketball.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class DetailTennisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tennis Details'),
      ),
      body: Center(
        child: Text(
          'Detailed information about Tennis.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class DetailHockeyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hockey Details'),
      ),
      body: Center(
        child: Text(
          'Detailed information about Hockey.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class DetailBaseballPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Baseball Details'),
      ),
      body: Center(
        child: Text(
          'Detailed information about Baseball.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class DetailVolleyballPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Volleyball Details'),
      ),
      body: Center(
        child: Text(
          'Detailed information about Volleyball.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class DetailCricketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cricket Details'),
      ),
      body: Center(
        child: Text(
          'Detailed information about Cricket.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class DetailRugbyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rugby Details'),
      ),
      body: Center(
        child: Text(
          'Detailed information about Rugby.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class DetailSwimmingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swimming Details'),
      ),
      body: Center(
        child: Text(
          'Detailed information about Swimming.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class DetailGolfPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Golf Details'),
      ),
      body: Center(
        child: Text(
          'Detailed information about Golf.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
