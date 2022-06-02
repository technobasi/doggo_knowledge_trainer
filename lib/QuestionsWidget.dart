import 'package:doggo_sachverstaendigen_trainer/TrainingScreen.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatefulWidget {
  final List<Question> questions;
  const QuestionWidget({Key? key, required this.questions}) : super(key: key);

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  bool questionMode = true;
  static const double SPACING = 10;


  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: const Text("Doggotraining")),
        body: Column(
          children: [
            if (questionMode && currentIndex < widget.questions.length) ...[
              const SizedBox(height: SPACING,),
              Container(
                width: 300,
                child: Text(widget.questions[currentIndex].question),
              ),
              const SizedBox(height: SPACING,),
              Column(
                children: [...widget.questions[currentIndex].answers.map((answer) =>
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            onChanged: (bool? value) {
                              setState(() {
                                answer.userAnswer = value!;
                              });
                            },
                            value: answer.userAnswer,
                          ),
                          Container(
                              width: 300,
                              child: Text(answer.text))
                        ],
                      ),
                    ))
                ],
              ),
              const SizedBox(height: SPACING,),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    questionMode = !questionMode;
                  });
                },
                child: const Text("Antwort prüfen"),
              )
            ],
            if (!questionMode  && currentIndex < widget.questions.length) ...[
              const SizedBox(height: SPACING,),
              const Text("Ergebnis"),
              const SizedBox(height: SPACING,),
              Column(
                children: [...widget.questions[currentIndex].answers.map((answer) =>
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: answer.isCorrect == answer.userAnswer
                                      ? Colors.green
                                      : Colors.red
                              ),
                              borderRadius: BorderRadius.circular(SPACING),
                              color: answer.isCorrect == answer.userAnswer
                                  ? Colors.green
                                  : Colors.red
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Checkbox(
                                onChanged: null,
                                value: answer.userAnswer,
                              ),
                              Container(
                                  width: 300,
                                  child: Text(answer.text))
                            ],
                          ),
                        ),
                      ),
                    ))
                ],
              ),
              const SizedBox(height: SPACING,),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.questions[currentIndex].answers.forEach((e) {
                      e.userAnswer = false;
                    });
                    widget.questions[currentIndex] = widget.questions[currentIndex];
                    currentIndex++;
                    questionMode = !questionMode;
                  });
                },
                child: const Text("Nächste Frage"),
              )
            ],
            if( currentIndex >= widget.questions.length) ... [
              Center(child: Text("Du hast alle Fragen beantwortet.:)\n Starte die App neu für eine neue Runde"))
            ]
          ],
        ));
  }
}