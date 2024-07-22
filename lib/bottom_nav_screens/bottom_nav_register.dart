import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usnController = TextEditingController();
  final TextEditingController _semController = TextEditingController();
  final TextEditingController _secController = TextEditingController();
  final TextEditingController _sportsController = TextEditingController();
  bool _isExperienced = false;
  PlatformFile? _achievementFile;

  bool _isSubmitting = false;

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );
    if (result != null) {
      setState(() {
        _achievementFile = result.files.first;
      });
    }
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isSubmitting = true;
    });

    try {
      final data = {
        'name': _nameController.text,
        'email': _emailController.text,
        'usn': _usnController.text,
        'sem': _semController.text,
        'sec': _secController.text,
        'sports': _sportsController.text.split(','),
        'isExperienced': _isExperienced,
      };

      if (_achievementFile != null) {
        final storageRef = FirebaseStorage.instance.ref().child('achievements/${_achievementFile!.name}');
        await storageRef.putData(_achievementFile!.bytes!);
        final fileUrl = await storageRef.getDownloadURL();
        data['achievementUrl'] = fileUrl;
      }

      await FirebaseFirestore.instance.collection('registrations').add(data);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Registration successful')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text('Registration Form')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(labelText: 'Name'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value!.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _usnController,
                      decoration: InputDecoration(labelText: 'USN'),
                      maxLength: 10,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your USN';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _semController,
                      decoration: InputDecoration(labelText: 'SEM'),
                      maxLength: 1,
                      validator: (value) {
                        if (value!.isEmpty || int.tryParse(value!) == null) {
                          return 'Please enter a valid semester';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _secController,
                      decoration: InputDecoration(labelText: 'SEC'),
                      maxLength: 1,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your section';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _sportsController,
                      decoration: InputDecoration(labelText: 'Interested Sports (comma separated)'),
                    ),
                    Row(
                      children: [
                        Text('Are you experienced?'),
                        Checkbox(
                          value: _isExperienced,
                          onChanged: (value) {
                            setState(() {
                              _isExperienced = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    if (_isExperienced)
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: _pickFile,
                            child: Text('Upload your achievement documents'),
                          ),
                          if (_achievementFile != null)
                            Text('Selected file: ${_achievementFile!.name}'),
                        ],
                      ),
                    SizedBox(height: 20),
                    _isSubmitting
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: _submitForm,
                            child: Text('Submit'),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
