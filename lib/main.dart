import 'package:first_app/entities.dart';
import 'package:first_app/quiz.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Question> _questions = [
    Question('What is your name?',
        [Question.createAnswer('Black', 1), Question.createAnswer('White', 0)]),
    Question('What is your surname?', [
      Question.createAnswer('Green', 1),
      Question.createAnswer('Yellow', 0)
    ]),
  ];

  var _index = 0;
  var _rank = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello app'),
        ),
        body: buildQuestionOrShowResult(),
      ),
    );
  }

  Widget buildQuestionOrShowResult() {
    if (_index == _questions.length) {
      return Quiz.result(_rank, () {
        setState(() {
          _index = 0;
          _rank = 0;
        });
      });
    }

    return Quiz.question(_questions[_index], (rank) {
      setState(() {
        _index += 1;
        _rank += rank;
      });
    });
  }
}
