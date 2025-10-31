import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      color: Colors.grey[400],
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Using Custom Card widget
          CustomCard(text: 'OOP', color: Colors.blue[100]!),
          CustomCard(text: 'DART', color: Colors.blue[300]!),
          CustomCard(text: 'FLUTTER', color: Colors.blue[600]!),
        ],
      ),
    ),
  ));
}

class CustomCard extends StatelessWidget {
  final String text;
  final Color color;
  const CustomCard({
    super.key,
    required this.text,
    this.color = Colors.blue, // default value
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: color,
      ),
      height: 60,
      width: double.infinity,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}