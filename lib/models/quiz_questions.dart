class Quizquestion{
  Quizquestion(this.text,this.answers);
  final String text;
  final List<String> answers;
  List<String> getShuffledans(){
    final List<String> shuffled=List.of(answers);
    shuffled.shuffle();   //shuffle is a feature used to shuffle the list.It changes the list which is why it is assigned to a new variable
    return shuffled;
  }
}