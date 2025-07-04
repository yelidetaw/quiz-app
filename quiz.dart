import 'package:flutter/material.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() => QuizState();
}

class QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  String activeScreen = 'start_screen';

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results_screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      //selectedAnswers = [];
      activeScreen = 'start_screen';
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions_screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions_screen') {
      screenWidget = QuestionsScreen(onselectAnswer: chooseAnswer);
    } else if (activeScreen == 'results_screen') {
      ResultsScreen(choosenAnswer: selectedAnswers, onRestart: restartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 76, 13, 185),
                Color.fromARGB(255, 107, 19, 122),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
