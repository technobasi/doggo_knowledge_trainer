class Answer {
  String text;
  bool isCorrect;
  bool userAnswer = false;

  Answer({required this.text, required this.isCorrect});

  static Answer fromJson(json) => Answer(text: json['text'], isCorrect: json['isCorrect']);

  @override
  String toString() {
    return 'Answer{text: $text, isCorrect: $isCorrect, userAnswer: $userAnswer }';
  }
}