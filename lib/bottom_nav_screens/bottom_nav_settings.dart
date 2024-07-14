import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // User card
          BigUserCard(
           
            userName: "John Doe",
            userProfilePic: AssetImage('assets/man.png'), // Replace with your image path
            userMoreInfo: Text(
              "User info",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SettingsGroup(
            items: [
              SettingsItem(
                onTap: () {},
                icons: Icons.person,
                iconStyle: IconStyle(
                  iconsColor: Colors.white,
                  withBackground: true,
                  backgroundColor: Colors.blue,
                ),
                title: 'Profile',
                subtitle: "Edit your profile",
              ),
              SettingsItem(
                onTap: () {},
                icons: Icons.lock,
                iconStyle: IconStyle(
                  iconsColor: Colors.white,
                  withBackground: true,
                  backgroundColor: Colors.red,
                ),
                title: 'Privacy',
                subtitle: "Privacy settings",
              ),
              SettingsItem(
                onTap: () {},
                icons: Icons.settings,
                iconStyle: IconStyle(
                  iconsColor: Colors.white,
                  withBackground: true,
                  backgroundColor: Colors.green,
                ),
                title: 'General',
                subtitle: "General settings",
              ),
            ],
          ),
          SettingsGroup(
            items: [
              SettingsItem(
                onTap: () {},
                icons: Icons.info,
                iconStyle: IconStyle(
                  iconsColor: Colors.white,
                  withBackground: true,
                  backgroundColor: Colors.purple,
                ),
                title: 'About',
                subtitle: "About the app",
              ),
              SettingsItem(
                onTap: () {},
                icons: Icons.exit_to_app,
                iconStyle: IconStyle(
                  iconsColor: Colors.white,
                  withBackground: true,
                  backgroundColor: Colors.orange,
                ),
                title: "Logout",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
