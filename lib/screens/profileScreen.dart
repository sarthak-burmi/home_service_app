import 'package:flutter/material.dart';
import 'package:home_service_app/services/appTextStyle.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 44,
                    backgroundImage: NetworkImage(
                      'https://randomuser.me/api/portraits/men/32.jpg',
                    ),
                  ),
                  SizedBox(height: 12),
                  Text('John Doe', style: AppTextStyles.heading),
                  Text('john.doe@email.com', style: AppTextStyles.body),
                ],
              ),
            ),
            SizedBox(height: 24),
            ListTile(
              leading: Icon(Icons.edit, color: Colors.black),
              title: Text('Edit Profile', style: AppTextStyles.cardTitle),
              trailing: Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.black),
              title: Text('Settings', style: AppTextStyles.cardTitle),
              trailing: Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.help_outline, color: Colors.black),
              title: Text('Help & Support', style: AppTextStyles.cardTitle),
              trailing: Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text(
                'Logout',
                style: AppTextStyles.cardTitle.copyWith(color: Colors.red),
              ),
              onTap: () {},
            ),
            SizedBox(height: 24),
            Center(child: Text('App Version 1.0', style: AppTextStyles.small)),
          ],
        ),
      ),
    );
  }
}
