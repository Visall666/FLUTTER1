import 'package:uuid/uuid.dart';
final _uuid = Uuid();

class Question {
  final String id;
  final String title;
  final List<String> choices;
  final String goodChoice;
  final int points;

  Question({
    String? id,
    required this.title,
    required this.choices,
    required this.goodChoice,
    this.points = 1,
  }) : id = id ?? _uuid.v4();
}

class Answer {
  final String id;
  final Question question;
  final String answerChoice;

  Answer({
    String? id,
    required this.question, 
    required this.answerChoice
  }) : id = id ?? _uuid.v4();

  bool isGood() {
    return this.answerChoice == question.goodChoice;
  }
}

class Player {
  final String id;
  final String name;

  Player({
    String? id, 
    required this.name
  }) : id = id ?? _uuid.v4();

  @override toString() => "$name";
}

class Submission {
  final String id;
  final Player player;
  final List<Answer> answers;
  final int scoreInPoint;
  final int scoreInPercentage;

  Submission({
    String? id,
    required this.player,
    required this.answers,
    required this.scoreInPoint,
    required this.scoreInPercentage,
  }) : id = id ?? _uuid.v4();

  // Getter to retrieve an answer from its ID
  Answer? getAnswerById(String id) {
    for (var a in answers) {
      if (a.id == id) return a;
    }
    return null;
  }

}

class Quiz {
  final String id;
  List<Question> questions;
  List<Submission> submissions = [];

  Quiz({
    String? id, 
    required this.questions
  }) : id = id ?? _uuid.v4();

  // Getter
  Question? getQuestionById(String id) {
    for (var q in questions) {
      if (q.id == id) return q;
    }
    return null;
  }

  int getScoreInPercentage(List<Answer> answers) {
    int totalScore = 0;
    for (Answer answer in answers) {
      if (answer.isGood()) {
        totalScore++;
      }
    }
    return ((totalScore / questions.length) * 100).toInt();
  }

  int getScoreInPoint(List<Answer> answers) {
    int totalPoint = 0;
    for (Answer answer in answers) {
      if (answer.isGood()) {
        totalPoint += answer.question.points;
      }
    }
    return totalPoint;
  }

  void submitQuiz(Player player, List<Answer> answers) {
    int points = getScoreInPoint(answers);
    int percentage = getScoreInPercentage(answers);

    // Check if player already exists or not
    Submission? existing;
    for (var s in submissions) {
      if (s.player.name == player.name) {
        existing = s;
        break;
      }
    }

    // Remove old submission
    if (existing != null) {
      submissions.remove(existing);
    }

    // Create and add new submission
    Submission newSubmission = Submission(
      player: player,
      answers: answers,
      scoreInPoint: points,
      scoreInPercentage: percentage,
    );

    submissions.add(newSubmission);
  }

  // Show all player results
  List<Submission> getAllSubmissions() {
    return submissions;
  }
}
