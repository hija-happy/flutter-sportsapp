import 'dart:ui';

import 'package:alvas_sports/utility/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class createAccount extends StatefulWidget {
  const createAccount({Key? key}) : super(key: key);

  @override
  _createAccountState createState() => _createAccountState();
}

class _createAccountState extends State<createAccount> {
  final _formKey = GlobalKey<FormState>(); // Key to identify the form
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _register() async {
  if (_formKey.currentState?.validate() ?? false) {
    try {
      // Create a new user with email and password
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Optionally, update user profile with display name
      await userCredential.user?.updateProfile(displayName: _usernameController.text.trim());

      // Notify user of successful registration
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Account Created. You may please proceed with login')),
      );

      // Navigate to login screen or home page
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));

    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase Authentication errors
      String message;
      switch (e.code) {
        case 'weak-password':
          message = 'The password provided is too weak.';
          break;
        case 'email-already-in-use':
          message = 'The account already exists for that email.';
          break;
        case 'invalid-email':
          message = 'The email address is badly formatted.';
          break;
        default:
          message = 'An undefined Error happened.';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } catch (e) {
      // Handle other errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to create account: $e')),
      );
    }
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/register_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 6.0,
                sigmaY: 5.0,
              ),
              child: Container(
                width: 400,
                height: double.infinity,
                padding: EdgeInsets.all(25.0),
                color: Colors.white.withOpacity(0.5),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Create Account",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(height: 60),
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          filled: true,
                          fillColor: Colors.blue.withOpacity(0.2),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          labelText: "Username",
                        ),
                        validator: Validators.validateUsername,
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          filled: true,
                          fillColor: Colors.blue.withOpacity(0.2),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          labelText: "Email",
                        ),
                        validator: Validators.validateEmail,
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          filled: true,
                          fillColor: Colors.blue.withOpacity(0.2),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          labelText: "Password",
                        ),
                        validator: Validators.validatePassword,
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: _register,
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(200, 50)),
                        ),
                        child: Text(
                          "Create Account",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Login"),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              // Handle Faculty Login action
                            },
                            child: Text("Faculty Login"),
                          ),
                          TextButton(
                            onPressed: () {
                              // Handle PD Login action
                            },
                            child: Text("PD Login"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up controllers when the widget is disposed
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
