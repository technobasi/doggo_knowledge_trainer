import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'TrainingScreen.dart';
import '../model/globals.dart' as globals;

class QuestionSelectionScreen extends StatelessWidget {
  static String routeName = "/";
  const QuestionSelectionScreen({Key? key}) : super(key: key);
  static final Uri _githubUrl = Uri.parse('https://github.com/technobasi/doggo_knowledge_trainer');
  static final Uri _kofiUrl = Uri.parse('https://ko-fi.com/shadowox');
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
              .toList(),
      /*    GestureDetector(
            onTap: () async {
              if(!await launchUrl(_kofiUrl)) throw 'Could not launch $_kofiUrl';
            },
            child: SizedBox(
                width: 300,
                child: Image.asset("assets/support/kofi-button.png")),
          ),
          SizedBox(
            height: 10,
          ),*/
          GestureDetector(
            onTap: () async {
              if(!await launchUrl(_githubUrl)) throw 'Could not launch $_githubUrl';
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  color: Colors.black,
                  width: 2
                )
              ),
              child: SizedBox(width: 300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset("assets/support/github.png"),
                      Text("Contribute on GithHub"),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
