
import 'dart:ui';

import 'package:alvas_sports/home.dart';
import 'package:alvas_sports/logins/mysi.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Stack(
              fit: StackFit.expand,
              children: [
                // Background Image
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/login_bg.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Center(
                  // Glassy Container
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5.0,
                        sigmaY: 5.0,
                      ),
                      child: Container(
                        padding: EdgeInsets.all(25.0),
                        width: constraints.maxWidth * 0.8, // Responsive width
                        constraints: BoxConstraints(maxWidth: 400),
                        color: Colors.white38,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            
                            Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            SizedBox(height: 60),
                            TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                filled: true,
                                fillColor: Colors.blue.withOpacity(0.2),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                labelText: "Email or Phone",
                              ),
                            ),
                            SizedBox(height: 30),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.blue.withOpacity(0.2),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                contentPadding: EdgeInsets.all(10),
                                labelText: "Password",
                              ),
                            ),
                            SizedBox(height: 30),
                            ElevatedButton(
                              style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(Size(200, 50))),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Home() ));
                              },
                              child: Text("Login",style: TextStyle(fontSize: 16)),
                            ),
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't have an account?"),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => createAccount(),
                                      ),
                                    );
                                  },
                                  child: Text("Create Here"),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      );
  
  }
}