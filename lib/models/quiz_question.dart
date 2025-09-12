class QuizQuestion {
  //constructor function
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswer() {
    //we copy the list and shuffle it
    //this is called chaining of commands
    final shuffledList = List.of(answers);
    shuffledList.shuffle();

    //since .shuffle do not return anything
    //we first copy the list to shuffledList and then add.shuffle
    //and return it
    return shuffledList;
  }
}
