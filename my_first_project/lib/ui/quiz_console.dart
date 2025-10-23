import 'dart:io';

import '../domain/quiz.dart';
import '../data/quiz_file_provider.dart';

class QuizConsole {
  Quiz quiz;
  QuizFileProvider? fileProvider;

  QuizConsole({required this.quiz, this.fileProvider});

  void startQuiz() {
    print('--- Welcome to the Quiz ---\n');

    while(true) {
      stdout.write('Your name: ');
      String? name = stdin.readLineSync();
      if (name == null || name.isEmpty) {
        break;
      }

      Player player = Player(name: name);
      
      List<Answer> answers = [];
      for (var question in quiz.questions) {
        print('Question: ${question.title} - ( ${question.points} points )');
        print('Choices: ${question.choices}');
        stdout.write('Your answer: ');
        String? userInput = stdin.readLineSync();

        // Check for null input
        if (userInput != null && userInput.isNotEmpty) {
          Answer answer = Answer(question: question, answerChoice: userInput);
          answers.add(answer);
        } else {
          print('No answer entered. Skipping question.');
        }

        print('');
      }

      // submit current quiz's player
      quiz.submitQuiz(player, answers);

      // Save quiz to file after each submission
      if (fileProvider != null) {
        fileProvider!.saveQuiz(quiz);
        print('Quiz saved to file.');
      }

      // show current result's player
      var submission = quiz.getAllSubmissions().firstWhere(
        (s) => s.player.name == player.name
      );
      
      print('${player.name}, Your score in percentage: ${submission.scoreInPercentage} % correct');
      print('${player.name}, Your score in points: ${submission.scoreInPoint}');


    }

    for (var s in quiz.getAllSubmissions()) {
      print(
        'Player: ${s.player.name}   Score: ${s.scoreInPoint}'
      );
    }
    
    // Final save before exiting
    if (fileProvider != null) {
      fileProvider!.saveQuiz(quiz);
      print('Final quiz state saved to file.');
    }
    
    print('--- Quiz Finished ---');
  }
}
 