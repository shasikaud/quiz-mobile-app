import 'package:flutter/material.dart';

class Question extends StatelessWidget {    //no underscore for Question cause need to be used in main.dart
  String questionText;
  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),   //10 device px as margin
      child: Text(
        questionText, 
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}