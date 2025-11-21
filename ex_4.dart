import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: const ScoreBarScreen(),
));

class ScoreBarScreen extends StatefulWidget {
  const ScoreBarScreen({super.key});

  @override
  State<ScoreBarScreen> createState() => _ScoreBarScreenState();
}

class _ScoreBarScreenState extends State<ScoreBarScreen> {
  int flutterScore = 7;
  int dartScore = 4;
  int reactScore = 9;
  final int maxScore = 10;

  void incrementScore(String language) {
    setState(() {
      if (language == 'flutter' && flutterScore < maxScore) {
        flutterScore++;
      } else if (language == 'dart' && dartScore < maxScore) {
        dartScore++;
      } else if (language == 'react' && reactScore < maxScore) {
        reactScore++;
      }
    });
  }

  void decrementScore(String language) {
    setState(() {
      if (language == 'flutter' && flutterScore > 0) {
        flutterScore--;
      } else if (language == 'dart' && dartScore > 0) {
        dartScore--;
      } else if (language == 'react' && reactScore > 0) {
        reactScore--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 143, 199, 38),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ScoreCardWidget(
              title: 'My score in Flutter',
              score: flutterScore,
              maxScore: maxScore,
              barColor: Colors.green.shade600,
              onIncrement: () => incrementScore('flutter'),
              onDecrement: () => decrementScore('flutter'),
            ),
            const SizedBox(height: 12),

            ScoreCardWidget(
              title: 'My score in Dart',
              score: dartScore,
              maxScore: maxScore,
              barColor: Colors.green.shade400,
              onIncrement: () => incrementScore('dart'),
              onDecrement: () => decrementScore('dart'),
            ),
            const SizedBox(height: 12),

            ScoreCardWidget(
              title: 'My score in React',
              score: reactScore,
              maxScore: maxScore,
              barColor: Colors.green.shade900,
              onIncrement: () => incrementScore('react'),
              onDecrement: () => decrementScore('react'),
            ),
          ],
        ),
      ),
    );
  }
}

class ScoreCardWidget extends StatelessWidget {
  final String title;
  final int score;
  final int maxScore;
  final Color barColor;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const ScoreCardWidget({
    super.key,
    required this.title,
    required this.score,
    required this.maxScore,
    required this.barColor,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 22,
                color: Colors.grey[500],
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 20),
            
            Row(
              children: [
                // Minus Button
                GestureDetector(
                  onTap: onDecrement,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '-',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // Progress Bar
                Expanded(
                  child: ProgressBarWidget(
                    score: score,
                    maxScore: maxScore,
                    barColor: barColor,
                  ),
                ),
                const SizedBox(width: 12),

                // Plus Button
                GestureDetector(
                  onTap: onIncrement,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            
            // Score Display
            Text(
              '$score / $maxScore',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressBarWidget extends StatelessWidget {
  final int score;
  final int maxScore;
  final Color barColor;

  const ProgressBarWidget({
    super.key,
    required this.score,
    required this.maxScore,
    required this.barColor,
  });

  @override
  Widget build(BuildContext context) {
    double percentage = score / maxScore;

    return Stack(
      children: [
        // empty Bar
        Container(
          height: 35,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey[300]!,
              width: 1,
            ),
          ),
        ),

        // Filled Bar
        Container(
          height: 35,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: FractionallySizedBox(
            widthFactor: percentage,
            child: Container(
              decoration: BoxDecoration(
                color: barColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}