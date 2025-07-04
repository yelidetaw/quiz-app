import 'package:flutter/material.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/summary.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({
    super.key,
    required this.choosenAnswer,
    required this.onRestart,
  });

  final List<String> choosenAnswer;
  final void Function() onRestart;

  @override
  State<ResultsScreen> createState() => ResultsScreenState();
}

class ResultsScreenState extends State<ResultsScreen> {
  void Restart() {
    setState(() {});
  }

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < widget.choosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': widget.choosenAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final SummaryData = getSummaryData();
    final numofquestions = questions.length;
    final numofanswered =
        SummaryData.where((data) {
          return data['correct_answer'] == data['user_answer'];
        }).length;
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'you answered $numofanswered  out of $numofquestions Correctly!',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              Center(
                child: SizedBox(
                  height: 300,
                  child: SingleChildScrollView(
                    child: Summary(getSummaryData()),
                  ),
                ),
              ),
              SizedBox(height: 30),
              TextButton.icon(
                onPressed: widget.onRestart,
                icon: Icon(Icons.restart_alt),
                label: Text(
                  'Restart Quiz',
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(iconColor: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
