import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  const Summary(this.SummaryData, {super.key});
  final List<Map<String, Object>> SummaryData;

  @override
  Widget build(context) {
    return Column(
      children:
          SummaryData.map((data) {
            return SizedBox(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          ((data['question_index'] as int) + 1,).toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            backgroundColor: Colors.blue,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            data['question'] as String,
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          data['correct_answer'] as String,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 3, 161, 8),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          data['user_answer'] as String,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 255, 19, 3),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
    );
  }
}
