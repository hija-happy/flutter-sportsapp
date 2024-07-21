import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrivacySettingsForm extends StatefulWidget {
  @override
  _PrivacySettingsFormState createState() => _PrivacySettingsFormState();
}

class _PrivacySettingsFormState extends State<PrivacySettingsForm> {
  bool _locationTracking = false;
  bool _notifications = false;
  bool _dataSharing = false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _locationTracking = prefs.getBool('locationTracking') ?? false;
      _notifications = prefs.getBool('notifications') ?? false;
      _dataSharing = prefs.getBool('dataSharing') ?? false;
    });
  }

  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('locationTracking', _locationTracking);
    await prefs.setBool('notifications', _notifications);
    await prefs.setBool('dataSharing', _dataSharing);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SwitchListTile(
              title: Text('Enable Location Tracking'),
              value: _locationTracking,
              onChanged: (bool value) {
                setState(() {
                  _locationTracking = value;
                });
                _saveSettings(); // Save settings immediately
              },
            ),
            SwitchListTile(
              title: Text('Enable Notifications'),
              value: _notifications,
              onChanged: (bool value) {
                setState(() {
                  _notifications = value;
                });
                _saveSettings(); // Save settings immediately
              },
            ),
            SwitchListTile(
              title: Text('Share Data with Third Parties'),
              value: _dataSharing,
              onChanged: (bool value) {
                setState(() {
                  _dataSharing = value;
                });
                _saveSettings(); // Save settings immediately
              },
            ),
          ],
        ),
      ),
    );
  }
}
