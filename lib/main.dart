import 'package:flutter/material.dart';
import 'intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Country Info App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const IntroPage(),
    );
  }
}
