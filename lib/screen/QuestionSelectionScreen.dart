import 'package:flutter/material.dart';
import 'TrainingScreen.dart';
import '../model/globals.dart' as globals;

class QuestionSelectionScreen extends StatelessWidget {
  static String routeName = "/";
  const QuestionSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doggotraining"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text("Bitte Fragenkatalog wählen"),
          ...globals.questionCatalog.keys
              .map((key) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(TrainingScreen.routeName,
                          arguments: globals.questionCatalog[key]);
                    },
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black
                            )
                          ),
                          width: 300,
                          child: Center(child: Text("$key")),
                        ),
                      ),
                    ),
                  ))
              .toList()
        ],
      ),
    );
  }
}
