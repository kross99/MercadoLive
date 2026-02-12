import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(SocialCommerceApp());
}

class SocialCommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Commerce',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(),
    );
  }
}