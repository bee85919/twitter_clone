import 'package:flutter/material.dart';
import 'package:twitter_clone/screens/verification_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter clone',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: const VerificationScreen(),
    );
  }
}
