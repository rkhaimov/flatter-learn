import 'package:first_app/Entities.dart';

class QuestionPresenter {
  get current {
    return _questions[_index];
  }

  get score {
    return _rank;
  }

  bool hasEnded() {
    return _index == _questions.length;
  }

  void retry() {
    _index = 0;
    _rank = 0;

    _notifyListeners();
  }

  void answerAndGoToNext(int rank) {
    _index += 1;
    _rank += rank;

    _notifyListeners();
  }

  final List<Question> _questions = [
    Question('What is your name?', [Answer('Black', 1), Answer('White', 0)]),
    Question(
        'What is your surname?', [Answer('Green', 1), Answer('Yellow', 0)]),
  ];

  var _index = 0;
  var _rank = 0;
  VoidCallback _notifyListeners;

  QuestionPresenter(this._notifyListeners);
}

typedef void VoidCallback();
