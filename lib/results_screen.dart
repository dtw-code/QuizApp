import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp_trialapp2/data/questions.dart';
import 'package:quizapp_trialapp2/questions_summary.dart';
import 'package:quizapp_trialapp2/quiz.dart';

class ResultScreen extends StatelessWidget{
  ResultScreen(this.selectedans,this.homescreen,{super.key});
  final List<String> selectedans;
  final VoidCallback homescreen;

  List<Map<String,Object>> getsummarydata(){
    final List<Map<String,Object>> summary=[];
    for(int i=0;i<question.length;i++){
      summary.add({
        'question_index':i,
        'question':question[i].text,
        'correct_answer':question[i].answers[0],
        'user_answer':selectedans[i]
      });
    }

    return summary;
  }




  @override
  Widget build(BuildContext context) {
    final totalquestion=question.length;
    final summaydata=getsummarydata();  //creates a iterable object to calculate  number of correct answers
    final correctans=summaydata.where((data){
      return data['user_answer']==data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child:Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text('You answered ${correctans} out of ${totalquestion} questions correctly',
              textAlign: TextAlign.center,
              style:GoogleFonts.lato(color: Colors.white,
                  fontWeight:FontWeight.bold,fontSize: 24),),
            const SizedBox(height: 30),

            QuestionSummary(getsummarydata()),

            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: homescreen,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255,161, 114, 34),
                foregroundColor: Colors.white,
              ),

              child: const Text('Restart Quiz'),

            )


          ]
        )
      )
    );
  }
}