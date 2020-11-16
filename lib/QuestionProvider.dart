import 'package:first_app/QuestionPresenter.dart';
import 'package:flutter/foundation.dart';

class QuestionProvider with ChangeNotifier, DiagnosticableTreeMixin {
  QuestionPresenter presenter;

  QuestionProvider() {
    presenter = QuestionPresenter(notifyListeners);
  }

  get () {
    return presenter;
  }
}
