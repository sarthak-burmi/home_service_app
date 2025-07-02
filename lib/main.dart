import 'package:flutter/material.dart';
import 'package:home_service_app/screens/add_address.dart';
import 'package:home_service_app/screens/otp_screen.dart';
import 'package:home_service_app/screens/login_screen.dart';
import 'package:home_service_app/screens/sign_up_screen.dart';
import 'package:home_service_app/screens/splash_screen.dart';

import 'package:home_service_app/services/naviagationState.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ELSSA App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AddNewAddressScreen(),
    );
  }
}
