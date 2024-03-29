import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText; // property

  Question(this.questionText); // Constructor with argument using short form

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
