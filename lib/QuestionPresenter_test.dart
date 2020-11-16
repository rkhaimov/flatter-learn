import 'package:first_app/QuestionPresenter.dart';
import 'package:test/test.dart';

void main() {
  group('QuestionPresenter', () {
    test('Should do the job', () {
      var presenter = QuestionPresenter(() {});

      expect(presenter.current != null, true);
    });
  });
}
