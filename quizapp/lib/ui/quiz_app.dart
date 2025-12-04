import 'package:flutter/material.dart';
import '../ui/screens/welcome_screen.dart';
import '../ui/screens/question_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp( {super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  bool showWelcome = true;

  void switchScreen() {
    setState(() {
      showWelcome = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: showWelcome ? WelcomeScreen(onStart: switchScreen,) : QuestionScreen()
        ),
      ),
    );
  }
}
