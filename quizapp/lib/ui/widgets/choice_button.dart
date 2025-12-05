import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const ChoiceButton({super.key, required this.text, required this.onTap, required this.selected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const  EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: selected ? Colors.white : Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: selected ? Colors.black : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}