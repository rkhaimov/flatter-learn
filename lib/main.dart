import 'package:first_app/QuestionProvider.dart';
import 'package:first_app/QuizParts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => QuestionProvider())],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello app'),
        ),
        body: buildQuestionOrShowResult(context),
      ),
    );
  }

  Widget buildQuestionOrShowResult(BuildContext context) {
    var presenter = context.watch<QuestionProvider>().get();

    if (presenter.hasEnded()) {
      return QuizResult(presenter.score, presenter.retry);
    }

    return QuizQuestion(presenter.current, presenter.answerAndGoToNext);
  }
}
