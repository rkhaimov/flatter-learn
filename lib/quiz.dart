import 'package:first_app/answer.dart';
import 'package:flutter/material.dart';

import 'entities.dart';

class Quiz {
  static Widget result(int rank, VoidCallback onFinish) {
    return _QuizResult(rank, onFinish);
  }

  static Widget question(Question question, AnswerOnQuestion answerOnQuestion) {
    return _QuizItem(question, answerOnQuestion);
  }
}

class _QuizResult extends StatelessWidget {
  final int rank;
  final VoidCallback onFinish;

  _QuizResult(this.rank, this.onFinish);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Your score is $rank',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: RaisedButton(
              onPressed: onFinish,
              child: Text(
                'Retry',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}

typedef void AnswerOnQuestion(int rank);

class _QuizItem extends StatelessWidget {
  final Question _question;
  final AnswerOnQuestion _answerOnQuestion;

  _QuizItem(this._question, this._answerOnQuestion);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuestionView(_question.text),
        ..._question.answers.map((answer) =>
            AnswerButton(() => _answerOnQuestion(answer.rank), answer.text)),
      ],
    );
  }
}

class QuestionView extends StatelessWidget {
  final String _text;

  QuestionView(this._text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _text,
            style: TextStyle(fontSize: 28),
          )
        ],
      ),
    );
  }
}
