class Question {
  static createAnswer(String answer, int rank) {
    return _Answer(answer, rank);
  }

  String text;
  List<_Answer> answers;

  Question(this.text, this.answers);
}

class _Answer {
  String text;
  int rank;

  _Answer(this.text, this.rank);
}
