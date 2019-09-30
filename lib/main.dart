import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

void main() => runApp(QuizApp());

// void main() {
//   runApp(QuizApp());
// }
/*
class QuizAppp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Quiz App'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text('Hello! Tarik.'),
              FlatButton(
                onPressed: () {
                  debugPrint('Flat Button onPressed...');
                },
                child: Text(
                  'FlatButton',
                ),
                color: Colors.red,
                textColor: Colors.white,
                hoverColor: Colors.black,
                splashColor: Colors.black,
                highlightColor: Colors.black,
                disabledColor: Colors.black,
                disabledTextColor: Colors.black,
              ),
              FlatButton.icon(
                onPressed: () {},
                icon: Icon(Icons.portrait),
                label: Text('Flat Button Icon'),
              ),
              RaisedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.portrait),
                label: Text('Flat Button Icon'),
              ),
              IconButton(
                icon: Icon(Icons.child_friendly),
                onPressed: () {},
              ),
              InkWell(
                child: Text(
                  "https://quickstartflutterdart.blogspot.in/",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      decoration: TextDecoration.underline),
                ),
                onTap: () {},
              ),
              GestureDetector(
                onTap: () {
                  print('Clicked on URL by GestureDetector Widget');
                },
                child: Text(
                  "https://quickstartflutterdart.blogspot.in/",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyAppState();
  }
}

class _MyAppState extends State<QuizApp> {
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
    print('Question Index: ' + _questionIndex.toString());
    if (_questionIndex < _questions.length) {
      print('We have more question!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
          appBar: AppBar(
            title: Text('My Quiz App'),
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
