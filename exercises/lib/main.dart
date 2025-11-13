import 'package:flutter/material.dart';
import 'exercises/ex3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Change this home to test different exercises
      // home: const MyHobbies(),
      home: const Product(),

      // Or use named routes:
      routes: {
        // '/ex1': (_) => const MyHobbies(),
        // '/ex2': (_) => const CustomButtons(),
        '/ex3': (_) => const Product(),

      },
    );
  }
}
