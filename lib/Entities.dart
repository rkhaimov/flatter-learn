class Question {
  String text;
  List<Answer> answers;

  Question(this.text, this.answers);
}

class Answer {
  String text;
  int rank;

  Answer(this.text, this.rank);
}
