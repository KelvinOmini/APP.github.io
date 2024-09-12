class QuizQuestions {
  const QuizQuestions(this.text, this.answers);
  
  final String text;
  final List<String> answers;

  List<String>get shuffledAnswers {
    final shuffledList = List.of(answers);
    shuffledList.shuffle(); //Chaining 
    return shuffledList;
  }
}

