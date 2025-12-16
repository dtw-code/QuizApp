import 'package:quizapp_trialapp2/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:quizapp_trialapp2/questions_screen.dart';
import 'package:quizapp_trialapp2/data/questions.dart';
import 'package:quizapp_trialapp2/results_screen.dart';
class Quiz extends StatefulWidget{
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }

}

class _QuizState extends State<Quiz> {

  Widget? activescreen;
  List<String> selectedans=[];

  void homescreen(){
    setState((){
      selectedans=[];
      activescreen=StartScreen(switchscreen);
    });
  }

  void addAns(String answers){
    selectedans.add(answers);
    if(selectedans.length==question.length){
      setState((){
        activescreen=ResultScreen(List.from(selectedans),homescreen);  //sends a copy of list of selectedans separately so that if selectedans gets refreshed first, the list doesnt show an empty value
        selectedans=[];
      });
    }
  }



  @override
  void initState(){
    super.initState();
    activescreen=StartScreen(switchscreen);
  }
  void switchscreen(){
    setState((){
      activescreen=Questions(addAns);
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors:
                  [Color.fromARGB(255, 26, 2, 80),
                    Color.fromARGB(255, 45, 7, 98)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight
                  ),
                ),
                child: activescreen
            )
        )
    );
  }
}