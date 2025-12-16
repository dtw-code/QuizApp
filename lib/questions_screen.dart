import 'package:flutter/material.dart';
import 'package:quizapp_trialapp2/answerbtn.dart';
import 'package:quizapp_trialapp2/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
 class Questions extends StatefulWidget{
   const Questions(this.addAns,{super.key});
   final void Function(String ans) addAns;
   @override
   State<Questions> createState() {
     return _QuestionsState();
   }
 }
 class _QuestionsState extends State<Questions> {
   var currquestionindex=0;
   void answerquestion(){
     setState(() {
       currquestionindex++;
     });
   }

   @override
   Widget build(BuildContext context) {
     final currquestion=question[currquestionindex];
     return Center(child:Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children:[
           Text(currquestion.text,
               style:GoogleFonts.lato(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 24),
             textAlign: TextAlign.center),

           const SizedBox(height: 20),

           ...currquestion.getShuffledans().map((answer){  //we are using the spread operator so that the listed value becomes comma separated values
             return Container(
               margin: EdgeInsets.only(bottom: 10,left: 30,right: 30),
               child: Ansbutton(answer,(){
                 widget.addAns(answer);
                 answerquestion();
               }),
             );
           }),

         ]
     ),
     );
   }
 }