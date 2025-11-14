import 'package:flutter/material.dart';
import 'exercises/ex4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // Change this home to test different exercises
      home: const WeatherApp(),

    );
  }
}
