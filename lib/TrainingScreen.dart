import 'package:doggo_sachverstaendigen_trainer/QuestionsWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
class TrainingScreen extends StatefulWidget {
  static String routeName = 'training';

  const TrainingScreen({Key? key}) : super(key: key);

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadQuestions(),
      builder: (BuildContext context, AsyncSnapshot<List<Question>> snapshot) {
        if (snapshot.hasData) {
          return QuestionWidget(questions: snapshot.data!,);
        } else {
        return const CircularProgressIndicator();
        }
      }
    );
  }

  Future<List<Question>> loadQuestions() async {
    var fileName = ModalRoute.of(context)?.settings.arguments as String;
    var jsonString =  await rootBundle.loadString("questions/$fileName");
    final jsonResponse = json.decode(jsonString) as List;
    var result = jsonResponse.map<Question>(Question.fromJson).toList();
    result.shuffle();
    return result;
  }
}


class Question {
  String question;

  List<Answer> answers;

  Question({
    required this.question,
    required this.answers
  });
  static Question fromJson(json) => Question(question: json['question'],
      answers: (json['answers'] as List).map(Answer.fromJson).toList());

  @override
  String toString() {
    return 'Question{question: $question, answers: $answers}';
  }
}

class Answer {
  String text;
  bool isCorrect;
  bool userAnswer = false;

  Answer({required this.text, required this.isCorrect});

  static Answer fromJson(json) => Answer(text: json['text'], isCorrect: json['isCorrect']);

  @override
  String toString() {
    return 'Answer{text: $text, isCorrect: $isCorrect, userAnswer: $userAnswer}';
  }
}
