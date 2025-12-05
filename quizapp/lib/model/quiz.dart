class Quiz {
  final List<Question> questions;

  Quiz({ required this.questions});
}
 
class Question {
  final String text;
  final List<String> choices;
  final int correctIndex;

  Question({ required this.text, required this.correctIndex, required this.choices});
}