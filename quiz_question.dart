class QuizQuestion {
  QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;
  List<String> shuffler() {
    final lists = List.of(answers);
    lists.shuffle();
    return lists;
  }
}
