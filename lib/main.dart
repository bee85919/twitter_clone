import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Twitter Logo'),
          leading: SvgPicture.asset('assets/svgs/twitter_logo.svg'),
        ),
        body: Center(
          child: Text('Welcome to Twitter!'),
        ),
      ),
    );
  }
}
