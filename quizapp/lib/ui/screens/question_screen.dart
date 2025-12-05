import 'package:flutter/material.dart';
import '../../model/quiz.dart';
import 'result_screen.dart';
import '../widgets/choice_button.dart';

class QuestionScreen extends StatefulWidget {
  final Quiz quiz;
  final VoidCallback onRestart;

  const QuestionScreen({super.key, required this.quiz, required this.onRestart});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int current = 0;
  int? selected;
  late List<int?> answers;

  @override
  void initState() {
    super.initState();
    answers = List<int?>.filled(widget.quiz.questions.length, null);
  }

  void next() {
    answers[current] = selected;

    if (current == widget.quiz.questions.length - 1) {
      int score = 0;
      for (int i = 0; i < widget.quiz.questions.length; i++) {
        if (answers[i] == widget.quiz.questions[i].correctIndex) score++;
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(
            quiz: widget.quiz,
            answers: answers,
            score: score,
            onRestart: widget.onRestart,
          ),
        ),
      );
      return;
    }

    setState(() {
      current++;
      selected = answers[current];
    });
  }

  @override
  Widget build(BuildContext context) {
    final q = widget.quiz.questions[current];

    return Scaffold(
      backgroundColor: const Color(0xFF2196F3),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                q.text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),

              // choices
              ...List.generate(q.choices.length, (i) {
                return ChoiceButton(
                  text: q.choices[i],
                  selected: selected == i,
                  onTap: () {
                    setState(() {
                      selected = i;
                    });
                  },
                );
              }),

              const Spacer(),

              Center(
                child: ElevatedButton(
                  onPressed: selected == null ? null : next,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF2196F3),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    current == widget.quiz.questions.length - 1
                        ? "Finish"
                        : "Next",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
