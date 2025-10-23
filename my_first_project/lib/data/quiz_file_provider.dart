import 'package:my_first_project/domain/quiz.dart';
import 'package:my_first_project/data/QuizRespository.dart';

class QuizFileProvider {
  final QuizRepository _repository;

  QuizFileProvider(String filePath) : _repository = QuizRepository(filePath);

  // Loads a quiz from the JSON file including all questions and submissions
  Quiz loadQuiz() {
    return _repository.readQuiz();
  }

  // Saves a quiz to the JSON file including all questions and submissions
  void saveQuiz(Quiz quiz) {
    _repository.saveQuiz(quiz);
  }

  // Loads a quiz and returns it, or creates a new empty quiz if file doesn't exist
  Quiz loadOrCreateQuiz() {
    try {
      return loadQuiz();
    } catch (e) {
      // If file doesn't exist or is corrupted, return empty quiz
      print('Warning: Could not load quiz file. Creating new quiz. Error: $e');
      return Quiz(questions: []);
    }
  }

  // Writes a quiz to the JSON file with proper formatting
  void writeQuiz(Quiz quiz) {
    _repository.saveQuiz(quiz);
    print('Quiz successfully written to JSON file.');
  }

  // Writes a quiz to a specific JSON file path
  void writeQuizToFile(Quiz quiz, String filePath) {
    final repository = QuizRepository(filePath);
    repository.saveQuiz(quiz);
    print('Quiz successfully written to: $filePath');
  }

  // Creates a new quiz file with the given quiz data
  void createNewQuizFile(Quiz quiz, String filePath) {
    final repository = QuizRepository(filePath);
    repository.saveQuiz(quiz);
    print('New quiz file created at: $filePath');
  }

  // Updates an existing quiz file (same as writeQuiz but with different naming)
  void updateQuiz(Quiz quiz) {
    writeQuiz(quiz);
  }

  // Creates a backup of the current quiz file
  void createBackup(String backupPath) {
    _repository.createBackup(backupPath);
  }
}
