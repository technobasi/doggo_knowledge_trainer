import 'dart:convert';

import 'package:doggo_sachverstaendigen_trainer/model/Question.dart';
import 'package:doggo_sachverstaendigen_trainer/widget/QuestionsWidget.dart';
import 'package:flutter/material.dart';

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
        future: loadQuestions(context),
        builder:
            (BuildContext context, AsyncSnapshot<List<Question>> snapshot) {
          print("test");
          if (snapshot.hasData) {
            return QuestionWidget(
              questions: snapshot.data!,
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }

  Future<List<Question>> loadQuestions(BuildContext context) async {
    var fileName = ModalRoute.of(context)?.settings.arguments as String;
    try {
      var jsonString = await DefaultAssetBundle.of(context)
          .loadString("assets/questions/$fileName");

      final jsonResponse = json.decode(jsonString) as List;
      print(jsonResponse.length);

      var result = jsonResponse.map<Question>(Question.fromJson).toList();
      print("here");
      result.shuffle();
      return result;
    } catch (e) {
      print(e);
      print("test");
      return [];
    }
  }
}
