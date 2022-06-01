import 'package:flutter/material.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({Key? key}) : super(key: key);

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  bool questionMode = true;
  List<Question> questions = [];

  Question currentQuestion = Question(question: "Testfrage", answers: [
    Answer(text: "Brot ist lecker?", isCorrect: true, userAnswer: false)
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Doggotraining")),
        body: Column(
          children: [
            if (questionMode) ...[
              Text(currentQuestion.question),
              Column(
                children: [...currentQuestion.answers.map((answer) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      onChanged: (bool? value) {
                        setState( () {
                          answer.userAnswer = value!;
                        });
                      },
                      value: answer.userAnswer,
                    ),
                    Text(answer.text)
                  ],
                ))],
              ),
              ElevatedButton(
                onPressed: () {
                    setState(() {
                      questionMode = !questionMode;
                    });
                },
                child: const Text("Antwort prüfen"),
              )
            ],
            if (!questionMode) ...[
              const Text("Ergebnis"),
              Column(
                children: [...currentQuestion.answers.map((answer) => Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: answer.isCorrect ? Colors.green : Colors.red
                    ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        onChanged: null,
                        value: answer.userAnswer,
                      ),
                      Text(answer.text)
                    ],
                  ),
                ))],
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    questionMode = !questionMode;
                  });
                },
                child: const Text("Nächste Frage"),
              )
            ]
          ],
        ));
  }
}

class Question {
  String question;

  List<Answer> answers;

  Question({
    required this.question,
    required this.answers
  });

  @override
  String toString() {
    return 'Question{question: $question, answers: $answers}';
  }
}

class Answer {
  String text;
  bool isCorrect;
  bool userAnswer;

  Answer({required this.text, required this.isCorrect, required this.userAnswer});

  @override
  String toString() {
    return 'Answer{text: $text, isCorrect: $isCorrect, userAnswer: $userAnswer}';
  }
}
