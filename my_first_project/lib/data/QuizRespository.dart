import 'package:my_first_project/domain/quiz.dart';
import 'dart:io';
import 'dart:convert';

class QuizRepository {
  final String filePath;

  QuizRepository(this.filePath);

  Quiz readQuiz() {
    final file = File(filePath);
    final content = file.readAsStringSync();
    final data = jsonDecode(content);

    // Read quiz ID
    String quizId = data['id'] ?? '';

    // Map JSON to domain objects for questions
    var questionsJson = data['questions'] as List;
    var questions = questionsJson.map((q) {
      return Question(
        id: q['id'], // Include the question ID from JSON
        title: q['title'],
        choices: List<String>.from(q['choices']),
        goodChoice: q['goodChoice'],
        points: q['points'],
      );
    }).toList();

    // Create quiz with ID from JSON
    Quiz quiz = Quiz(id: quizId, questions: questions);

    // Read and map submissions
    var submissionsJson = data['submissions'] as List;
    for (var submissionData in submissionsJson) {
      // Create player
      var playerData = submissionData['player'];
      Player player = Player(
        id: playerData['id'],
        name: playerData['name'],
      );

      // Create answers
      var answersData = submissionData['answers'] as List;
      List<Answer> answers = answersData.map((answerData) {
        // Find the question by ID
        Question? question = quiz.getQuestionById(answerData['questionId']);
        if (question == null) {
          throw Exception('Question with ID ${answerData['questionId']} not found');
        }
        
        return Answer(
          id: answerData['id'],
          question: question,
          answerChoice: answerData['answerChoice'],
        );
      }).toList();

      // Create submission
      Submission submission = Submission(
        id: submissionData['id'],
        player: player,
        answers: answers,
        scoreInPoint: submissionData['scoreInPoint'],
        scoreInPercentage: submissionData['scoreInPercentage'],
      );

      // Add submission to quiz
      quiz.submissions.add(submission);
    }

    return quiz;
  }

  void saveQuiz(Quiz quiz) {
    writeQuizToFile(quiz, filePath);
  }

  // Writes a quiz to the specified file path with proper formatting
  void writeQuizToFile(Quiz quiz, String filePath) {
    try {
      final file = File(filePath);
      
      // Convert quiz to JSON format
      Map<String, dynamic> quizData = {
        'id': quiz.id,
        'title': 'Testing Quiz', 
        'questions': quiz.questions.map((q) => {
          'id': q.id,
          'title': q.title,
          'choices': q.choices,
          'goodChoice': q.goodChoice,
          'points': q.points,
        }).toList(),
        'submissions': quiz.submissions.map((s) => {
          'id': s.id,
          'player': {
            'id': s.player.id,
            'name': s.player.name,
          },
          'answers': s.answers.map((a) => {
            'id': a.id,
            'questionId': a.question.id,
            'answerChoice': a.answerChoice,
          }).toList(),
          'scoreInPoint': s.scoreInPoint,
          'scoreInPercentage': s.scoreInPercentage,
        }).toList(),
      };

      // Write to file with proper formatting
      const encoder = JsonEncoder.withIndent('  ');
      file.writeAsStringSync(encoder.convert(quizData));
      
      print('Quiz successfully written to: $filePath');
    } catch (e) {
      print('Error writing quiz to file: $e');
      rethrow;
    }
  }

  // Creates a backup of the current quiz file
  void createBackup(String backupPath) {
    try {
      final originalFile = File(filePath);
      final backupFile = File(backupPath);
      
      if (originalFile.existsSync()) {
        originalFile.copySync(backupPath);
        print('Backup created at: $backupPath');
      } else {
        print('Original file does not exist, cannot create backup.');
      }
    } catch (e) {
      print('Error creating backup: $e');
    }
  }
}