import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final Function onPressed;
  final String text;

  AnswerButton(this.onPressed, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        onPressed: onPressed,
        child: Text(text, style: TextStyle(color: Colors.white),),
        color: Colors.blue,
      ),
    );
  }
}
