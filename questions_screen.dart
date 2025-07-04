import 'package:flutter/material.dart';
import 'package:quiz_app/answerbutton.dart';
import 'package:quiz_app/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onselectAnswer});

  final void Function(String answer) onselectAnswer;
  @override
  State<QuestionsScreen> createState() {
    return QuestionScreenState();
  }
}

class QuestionScreenState extends State<QuestionsScreen> {
  var QuestionIndex = 0;
  void selectedanswer(String selectedanswer) {
    widget.onselectAnswer(selectedanswer);
    setState(() {
      QuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentquestion = questions[QuestionIndex];

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 76, 13, 185),
                const Color.fromARGB(255, 107, 19, 122),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  currentquestion.text,
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ...currentquestion.shuffler().map((answer) {
                  return AnswerButton(
                    ontap: () {
                      selectedanswer(answer);
                    },
                    answer: answer,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
