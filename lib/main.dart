import 'package:doggo_sachverstaendigen_trainer/QuestionSelectionScreen.dart';
import 'package:flutter/material.dart';

import 'TrainingScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Doggo Sachkundetrainer",
      theme: ThemeData(
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      initialRoute: QuestionSelectionScreen.routeName,
      routes: {
        QuestionSelectionScreen.routeName: (context) {
          return const QuestionSelectionScreen();
        },
        TrainingScreen.routeName: (context) {
          return const TrainingScreen();
        }
      },
    );
  }
}
