import 'package:my_first_project/domain/quiz.dart';
import 'package:test/test.dart';
import 'package:my_first_project/data/QuizRespository.dart';

main() {
  test('Read quiz from JSON and test multiple players submissions', () {
    // Path relative to project root
    final repo = QuizRepository('assets/quiz.json');
    final quiz = repo.readQuiz();

    // Player 1 (correct)
    final p1 = Player(id: 'p1', name: 'Visal');
    final a1 = [
      Answer(
          question: quiz.questions.firstWhere((q) => q.id == 'q1'),
          answerChoice: '1'),
      Answer(
          question: quiz.questions.firstWhere((q) => q.id == 'q2'),
          answerChoice: '7'),
    ];
    quiz.submitQuiz(p1, a1);

    // Player 2 (wrong)
    final p2 = Player(id: 'p2', name: 'Lyly');
    final a2 = [
      Answer(
          question: quiz.questions.firstWhere((q) => q.id == 'q1'),
          answerChoice: '2'),
      Answer(
          question: quiz.questions.firstWhere((q) => q.id == 'q2'),
          answerChoice: '6'),
    ];
    quiz.submitQuiz(p2, a2);

    // Verify number of submissions
    expect(quiz.submissions.length, equals(2));

    // Check Visal’s score
    final visalSub =
        quiz.submissions.firstWhere((s) => s.player.name == 'Visal');
    expect(visalSub.scoreInPoint, equals(100)); // total points = 100
    expect(visalSub.scoreInPercentage, equals(100));

    // Check Lyly’s score (less than 100%)
    final lylySub =
        quiz.submissions.firstWhere((s) => s.player.name == 'Lyly');
    expect(lylySub.scoreInPercentage, lessThan(100));

  });
}