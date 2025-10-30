import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      color: Colors.grey[400],
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 1st Container: OOP
          Container(
            margin: EdgeInsets.only(bottom: 20.0),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(30.0),
            ),
            height: 60,
            width: double.infinity,
            child: Center(
              child: Text(
                'OOP',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // 2nd Container: DART
          Container(
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.blue[300],
            ),
            height: 60,
            width: double.infinity,
            child: Center(
              child: Text(
                'DART',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // 3rd Container: FLUTTER
          // 2nd Container: DART
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              // color: Colors.blue[600],
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(0.8, 1),
                colors: <Color>[
                  Color(0xFF64B5F6),
                  Color(0xFF42A5F5),
                  Color(0xFF1E88E5),
                ]
              ),
            ),
            height: 60,
            width: double.infinity,
            child: Center(
              child: Text(
                'FLUTTER',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ));
}
