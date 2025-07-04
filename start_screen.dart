import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/quiz-logo.png',
                color: const Color.fromARGB(132, 255, 255, 255),
              ),
              const SizedBox(height: 30),
              const Text(
                'Learn Flutter the fun way',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(height: 30),
              OutlinedButton.icon(
                onPressed: switchScreen,
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Start Quiz'),
                style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
