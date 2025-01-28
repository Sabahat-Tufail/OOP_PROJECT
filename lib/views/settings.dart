import 'package:flutter/material.dart';

import '../utils/contants/global.dart';

class MySettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Profile Section
            _buildProfileSection(),
            SizedBox(height: 20),
            // Settings Options
            _buildSettingsOption('Account', Icons.person),
            _buildSettingsOption('Notifications', Icons.notifications),
            _buildSettingsOption('Privacy', Icons.lock),
            _buildSettingsOption('Help & Support', Icons.help),
            _buildSettingsOption('About', Icons.info),
            SizedBox(height: 20),
            // Logout Button
            ElevatedButton(
              onPressed: () {
                // Handle logout
              },
              child: Text('Logout', style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffd20606),
                padding: EdgeInsets.symmetric(vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
        CircleAvatar(
        radius: 40,
        backgroundColor: primaryColor, // Background color for the avatar
        child: Icon(
          Icons.person,
          size: 40,
          color: Colors.white, // Icon color
        ),),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sabaht',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                'sabaht@gmail.com',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsOption(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: primaryColor),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
      onTap: () {
        // Handle tap
      },
    );
  }
}