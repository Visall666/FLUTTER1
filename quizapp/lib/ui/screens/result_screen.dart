import 'package:flutter/material.dart';
import '../../model/quiz.dart';

class ResultScreen extends StatelessWidget {
  final Quiz quiz;
  final List<int?> answers;
  final int score;
  final VoidCallback onRestart;

  const ResultScreen({
    super.key,
    required this.quiz,
    required this.answers,
    required this.score,
    required this.onRestart
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2196F3),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "You answered $score on ${quiz.questions.length}!",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),

              // LIST OF QUESTIONS
              Expanded(
                child: ListView.builder(
                  itemCount: quiz.questions.length,
                  itemBuilder: (_, i) {
                    final q = quiz.questions[i];
                    final userAns = answers[i];
                    final correct = q.correctIndex;

                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Number bubble
                          CircleAvatar(
                            radius: 14,
                            backgroundColor: Colors.white,
                            child: Text(
                              "${i + 1}",
                              style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),

                          Text(
                            q.text,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 6),

                          // choices
                          ...List.generate(q.choices.length, (j) {
                            final isCorrect = j == correct;
                            final isSelected = j == userAns;

                            Color? color;
                            if (isCorrect) color = Colors.green;
                            if (isSelected && !isCorrect) color = Colors.red;

                            return Padding(
                              padding: const EdgeInsets.only(left: 10, top: 4),
                              child: Text(
                                q.choices[j],
                                style: TextStyle(
                                  color: color ?? Colors.black87,
                                  fontSize: 16,
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    );
                  },
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  // call the callback to show WelcomeScreen
                  onRestart();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF2196F3),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text(
                  "Restart Quiz",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
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
