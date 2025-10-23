import 'domain/quiz.dart';
import 'ui/quiz_console.dart';
import 'data/quiz_file_provider.dart';

void main() {
  // Load quiz from JSON file
  QuizFileProvider fileProvider = QuizFileProvider('assets/quiz.json');
  Quiz quiz = fileProvider.loadOrCreateQuiz();
  
  print('Loaded Quiz ID: ${quiz.id}');
  print('Number of questions: ${quiz.questions.length}');
  print('Number of existing submissions: ${quiz.submissions.length}');
  print('');

  QuizConsole console = QuizConsole(quiz: quiz, fileProvider: fileProvider);
  console.startQuiz();
}
