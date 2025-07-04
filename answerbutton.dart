import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({required this.ontap, required this.answer, super.key});
  final void Function() ontap;
  final answer;
  @override
  Widget build(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      //padding: ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: ontap,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 24, 3, 61),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),

            child: Text(answer),
          ),
        ],
      ),
    );
  }
}
