import 'package:flutter/material.dart';
import '../../model/quiz.dart';
import '../ui/screens/question_screen.dart';
import '../ui/screens/welcome_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  bool showWelcome = true;

  final quizs = Quiz(questions: [
    Question(
      text: "Who is the best teacher?",
      choices: ["Ronan", "Hongly", "Leangsiv"],
      correctIndex: 0,
    ),
    Question( 
      text: "What is the best color?",
      choices: ["Blue", "Red", "Green"],
      correctIndex: 2,
    ),
  ]);

  void startQuiz() => setState(() {
    showWelcome = false;
  });

  void restart() => setState(() {
    showWelcome = true;
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: showWelcome
          ? WelcomeScreen(onStart: startQuiz)
          : QuestionScreen(quiz: quizs, onRestart: restart),
    );
  }
}
