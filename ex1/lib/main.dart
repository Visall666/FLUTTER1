import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GradientButton(
                text: 'Login',
                gradientColors: const [
                  Colors.orange,
                  Colors.deepOrangeAccent,
                ],
                onPressed: () {
                  print('Login Button Pressed!');
                },
              ),
              const SizedBox(height: 20), // space between buttons
              GradientButton(
                text: 'Sign Up',
                gradientColors: const [
                  Colors.lightBlueAccent,
                  Colors.blue,
                ],
                onPressed: () {
                  print('Sign Up Button Pressed!');
                },
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class GradientButton extends StatelessWidget {
  final String text;
  final List<Color> gradientColors;
  final VoidCallback onPressed;

  const GradientButton({
    super.key,
    required this.text,
    required this.gradientColors,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
