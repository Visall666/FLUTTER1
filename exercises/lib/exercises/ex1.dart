import 'package:flutter/material.dart';

class MyHobbies extends StatelessWidget {
  const MyHobbies({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Hobbies'),
        ),
        backgroundColor: Colors.grey,
        body: Padding(
          padding: EdgeInsets.all(40.0),
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HobbyCard(title: 'Travelling', icon: Icons.travel_explore, backgroundColor: Colors.green,),
              SizedBox(height: 10,),
              HobbyCard(title: 'Skating', icon: Icons.skateboarding, backgroundColor: Colors.blueGrey,),
            ],
          ),
        ),    
      ),
    );
  }
}

class HobbyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color backgroundColor;
  const HobbyCard({
    super.key,
    required this.title,
    required this.icon,
    this.backgroundColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right:20),
              child: Icon(
                icon,
                color: Colors.white,
                size: 24,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}