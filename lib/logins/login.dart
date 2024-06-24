import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/Achievement-bro.png'), 
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lexend', // Use Lexend font
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Username',
                        filled: true, // Fill with light grey color
                        fillColor: Colors.grey[200], // Light grey color
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0), // Circular outline
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        filled: true, // Fill with light grey color
                        fillColor: Colors.grey[200], // Light grey color
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0), // Circular outline
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        // Add login logic here
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple[100], // Light purple color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0), // Circular button
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'Lexend', // Use Lexend font
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    GestureDetector(
                      onTap: () {
                        // Add navigation to registration screen
                      },
                      child: Text(
                        'Don\'t have an account? Register',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Lexend', // Use Lexend font
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
