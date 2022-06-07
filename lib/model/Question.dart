import 'package:doggo_sachverstaendigen_trainer/model/Answer.dart';

class Question {
  String question;

  List<Answer> answers;
  String? image;

  Question({
    required this.question,
    required this.answers,
    this.image
  });
  static Question fromJson(json) {
    Question loadedQuestion =  Question(question: json['question'],
        image: json['image'],
        answers: (json['answers'] as List).map(Answer.fromJson).toList());
    loadedQuestion.answers.shuffle();
    return loadedQuestion;
  }

  @override
  String toString() {
    return 'Question{question: $question, answers: $answers, image: $image}';
  }
}