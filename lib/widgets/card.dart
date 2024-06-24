import 'package:flutter/material.dart';

class Customcard extends StatelessWidget {

  final String text;
  const Customcard({Key? key, required this.text}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return  Card(

        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center, ),
          )
          ),
    );
  }
}