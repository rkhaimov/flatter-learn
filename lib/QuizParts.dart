import 'package:first_app/AnswerButton.dart';
import 'package:flutter/material.dart';

import 'Entities.dart';

class QuizResult extends StatelessWidget {
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

  final int rank;
  final VoidCallback onFinish;

  QuizResult(this.rank, this.onFinish);
}

typedef void AnswerOnQuestion(int rank);

class QuizQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildQuestionText(_question.text),
        ..._question.answers.map((answer) =>
            AnswerButton(() => _answerOnQuestion(answer.rank), answer.text)),
      ],
    );
  }

  Widget _buildQuestionText(String text) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 28),
          )
        ],
      ),
    );
  }

  final Question _question;
  final AnswerOnQuestion _answerOnQuestion;

  QuizQuestion(this._question, this._answerOnQuestion);
}
