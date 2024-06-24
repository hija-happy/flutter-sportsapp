import 'package:alvas_sports/home.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
            width: 300,
            child: Image.asset('assets/college_logo.jpg'),
          ),
          SizedBox(height: 30,),
          Container(
            child: Text('Welcome to Alva\'s Sports Hub ',
              style: TextStyle(fontSize: 40,
              fontWeight: FontWeight.bold,
              ),
            ),
            
          ),
          SizedBox(height: 30,),
           Container(
            child: Text('Explore Alva\’s Institute sports, register for teams, get trained, and stay updated on achievements and events. Connect with your favorite teams and relive past events through our gallery!',
              style: TextStyle(fontSize: 35,
              ),
            ),
          ),
      SizedBox(height: 30,),
           Container(
           child: ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
            },
            child: Text("Get Started"),
            ),
          ),
        ]
        ),
    );
  }
}