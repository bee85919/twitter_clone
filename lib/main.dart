import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/screens/main_screen.dart';


void main() {
  runApp(const TwitterClone());
}


class TwitterClone extends StatelessWidget {
  const TwitterClone({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTok Clone',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.blue,
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

