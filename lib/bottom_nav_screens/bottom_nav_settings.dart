import 'dart:typed_data';

import 'package:alvas_sports/drawer_screens/about_us.dart';
import 'package:alvas_sports/logins/mylo.dart';
import 'package:alvas_sports/screens/Settings/privacy_settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show Uint8List, kIsWeb;
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final ImagePicker _picker = ImagePicker();
  final String _defaultImagePath = 'assets/man.jpg'; // Default image
  String? _imageUrl;

  @override
  void initState() {
    super.initState();
    _loadProfileImage();
  }

  Future<void> _loadProfileImage() async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('profile_photo').doc('user_profile').get();
      setState(() {
        _imageUrl = snapshot['imageUrl'];
      });
    } catch (e) {
      print('Error loading profile image: $e');
    }
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      await _uploadImage(image);
    }
  }

  Future<void> _uploadImage(XFile image) async {
    try {
      final fileName = image.name;
      final storageRef = FirebaseStorage.instance.ref().child('profile_photos/$fileName');

      final imageBytes = await image.readAsBytes();
      final img.Image? imageFile = img.decodeImage(imageBytes);

      if (imageFile == null) {
        print('Failed to decode image.');
        return;
      }

      final resizedImage = img.copyResize(imageFile, width: 800); // Resize image to 800px wide
      final compressedImage = img.encodeJpg(resizedImage, quality: 80); // Compress image

      final uploadTask = storageRef.putData(Uint8List.fromList(compressedImage));
      final snapshot = await uploadTask;
      final imageUrl = await snapshot.ref.getDownloadURL();

      await FirebaseFirestore.instance.collection('profile_photo').doc('user_profile').set({
        'imageUrl': imageUrl,
      });

      setState(() {
        _imageUrl = imageUrl;
      });
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login()));
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          // User card
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Stack(
                  children: [
                    FutureBuilder(
                      future: _loadProfileImage(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(_defaultImagePath),
                          );
                        } else if (snapshot.hasError || _imageUrl == null) {
                          return CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(_defaultImagePath),
                          );
                        } else {
                          return CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(_imageUrl!),
                          );
                        }
                      },
                    ),
                    Positioned(
                      right: -10,
                      bottom: -10,
                      child: IconButton(
                        icon: Icon(Icons.add_a_photo, color: Colors.blue, size: 30),
                        onPressed: _pickImage,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'User info',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          // Settings options
          ListTile(
            leading: Icon(Icons.person, color: Colors.blue),
            title: Text('Profile'),
            subtitle: Text('Edit your profile'),
            onTap: () {
              // Handle the tap
            },
          ),
          ListTile(
            leading: Icon(Icons.lock, color: Colors.red),
            title: Text('Privacy'),
            subtitle: Text('Privacy settings'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacySettingsForm()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.green),
            title: Text('General'),
            subtitle: Text('General settings'),
            onTap: () {
              // Handle the tap
            },
          ),
          ListTile(
            leading: Icon(Icons.info, color: Colors.purple),
            title: Text('About'),
            subtitle: Text('About the app'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.orange),
            title: Text('Logout'),
            onTap: _signOut,
          ),
        ],
      ),
    );
  }
}
