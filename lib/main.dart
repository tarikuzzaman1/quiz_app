import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

void main() => runApp(QuizApp());

// void main() {
//   runApp(QuizApp());
// }
class QuizApp extends StatelessWidget {
  Widget build(BuildContext context){
    return MaterialApp(home: Text('Hello! Tarik'),);
  }
}


class QuizAppp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MyAppState();
  }
}

class _MyAppState extends State<QuizAppp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Elephant', 'score': 11},
        {'text': 'Tiger', 'score': 5},
        {'text': 'Lion', 'score': 9}
      ]
    },
    {
      'questionText': 'Who\'s your favorite instractor?',
      'answers': [
        {'text': 'Max', 'score': 10},
        {'text': 'Youtube', 'score': 9},
        {'text': 'Facebook', 'score': 7},
        {'text': 'Blog', 'score': 2}
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    //print(_questions[_questionIndex]);
    print('Question Index: '+_questionIndex.toString());
    if (_questionIndex < _questions.length) {
      print('We have more question!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['Hello'];
    // dummy.add('Tarik');
    // print(dummy);
    // dummy = [];

    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
