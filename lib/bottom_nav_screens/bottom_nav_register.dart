import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _sectionController = TextEditingController();
  final TextEditingController _achievementsController = TextEditingController();
  String? _branch;
  String? _sem;
  List<String> _sports = ['Kabbadi','Cricket','Kho-Kho'];
  
  final List<String> _branches = ['CSE', 'ISE', 'EEE', 'ECE', 'AIML'];
  final List<String> _sems = ['1', '2', '3', '4', '5', '6', '7', '8'];

  void _handleCheckboxChanged(String sport, bool? isChecked) {
    setState(() {
      if (isChecked == true) {
        _sports.add(sport);
      } else {
        _sports.remove(sport);
      }
    });
  }

 void _submitForm() async {
  if (_formKey.currentState?.validate() ?? false) {
    _formKey.currentState?.save();

    try {
      await FirebaseFirestore.instance.collection('Sports_Registration').add({
        'name': _nameController.text,
        'email': _emailController.text,
        'phone': _phoneController.text,
        'age': _ageController.text,
        'branch': _branch,
        'sem': _sem,
        'section': _sectionController.text,
        'sports': _sports,
        'achievements': _achievementsController.text,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form submitted successfully')),
      );

      // Clear the form fields
      _formKey.currentState?.reset();
      setState(() {
        _sports.clear();
      });
    } catch (e) {
      // Log or handle the error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to submit form: $e')),
      );
    }
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) => value?.isEmpty ?? true ? 'Please enter your name' : null,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => value?.isEmpty ?? true ? 'Please enter your email' : null,
                ),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  keyboardType: TextInputType.phone,
                  validator: (value) => value?.isEmpty ?? true ? 'Please enter your phone number' : null,
                ),
                TextFormField(
                  controller: _ageController,
                  decoration: InputDecoration(labelText: 'Age'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value?.isEmpty ?? true ? 'Please enter your age' : null,
                ),
                DropdownButtonFormField<String>(
                  value: _branch,
                  decoration: InputDecoration(labelText: 'Branch'),
                  items: _branches.map((branch) => DropdownMenuItem(
                    value: branch,
                    child: Text(branch),
                  )).toList(),
                  onChanged: (value) => setState(() => _branch = value),
                  validator: (value) => value == null ? 'Please select a branch' : null,
                ),
                DropdownButtonFormField<String>(
                  value: _sem,
                  decoration: InputDecoration(labelText: 'Sem'),
                  items: _sems.map((sem) => DropdownMenuItem(
                    value: sem,
                    child: Text(sem),
                  )).toList(),
                  onChanged: (value) => setState(() => _sem = value),
                  validator: (value) => value == null ? 'Please select a semester' : null,
                ),
                TextFormField(
                  controller: _sectionController,
                  decoration: InputDecoration(labelText: 'Section'),
                  maxLength: 1,
                  validator: (value) => value?.isEmpty ?? true ? 'Please enter your section' : null,
                ),
                CheckboxListTile(
                  title: Text('Interested Sports'),
                  value: _sports.contains('Kabbadi'),
                  onChanged: (bool? isChecked) => _handleCheckboxChanged('Kabbadi', isChecked),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: Text('Kho'),
                  value: _sports.contains('Kho'),
                  onChanged: (bool? isChecked) => _handleCheckboxChanged('Kho', isChecked),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: Text('Cricket'),
                  value: _sports.contains('Cricket'),
                  onChanged: (bool? isChecked) => _handleCheckboxChanged('Cricket', isChecked),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: Text('Football'),
                  value: _sports.contains('Football'),
                  onChanged: (bool? isChecked) => _handleCheckboxChanged('Football', isChecked),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: Text('Volleyball'),
                  value: _sports.contains('Volleyball'),
                  onChanged: (bool? isChecked) => _handleCheckboxChanged('Volleyball', isChecked),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                TextFormField(
                  controller: _achievementsController,
                  decoration: InputDecoration(labelText: 'Achievements'),
                  maxLines: 3,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
