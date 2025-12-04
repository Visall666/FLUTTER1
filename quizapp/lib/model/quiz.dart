class Quiz {
  final String title;
  final List<Question> questions;

  Quiz({ required this.title, required this.questions});
}
 
class Question {
  final String text;
  final List<String> choices;
  final int correctIndex;

  Question({ required this.text, required this.correctIndex, required this.choices});
}