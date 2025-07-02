import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Replace with your logo asset
                Image.asset('assets/images/logo.png', height: 120),
                SizedBox(height: 16),
              ],
            ),
          ),
          Positioned(
            bottom: 32,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  'Powered by Oyelabs',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                Text(
                  'WITH LOVE 💙',
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
