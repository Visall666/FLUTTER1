import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: ScorePage(),
  ));
}

class ScorePage extends StatelessWidget {
  const ScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Score Bar")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: List.generate(
            10,
            (i) => ScoreCard(title: "Score ${i + 1}"),
          ),
        ),
      ),
    );
  }
}
class ScoreCard extends StatefulWidget {
  final String title;

  const ScoreCard({super.key, required this.title});

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  int score = 0; // 0 → 10

  void increaseScore() {
    setState(() {
      score = (score + 1) % 11; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: increaseScore,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            // TITLE
            SizedBox(
              width: 80,
              child: Text(
                widget.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            Expanded(
              child: ScoreProgressBar(
                value: score,
                maxValue: 10,
              ),
            ),

            const SizedBox(width: 12),

            Text(
              "$score",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
class ScoreProgressBar extends StatelessWidget {
  final int value;
  final int maxValue;

  const ScoreProgressBar({
    super.key,
    required this.value,
    required this.maxValue,
  });

  @override
  Widget build(BuildContext context) {
    double progress = value / maxValue;

    return SizedBox(
      height: 20,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
            ),
          ),

          FractionallySizedBox(
            widthFactor: progress,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
