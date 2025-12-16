import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp_trialapp2/data/questions.dart';
import 'package:flutter/material.dart';


class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.getsummarydata, {super.key});

  final List<Map<String, Object>> getsummarydata;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:400,    //sizedBox and SingleChildView is used to make it scrollable
      child: SingleChildScrollView(
        child: Column(
          children: getsummarydata.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Question index
                Text(((data['question_index'] as int)+1).toString(),style:GoogleFonts.lato(color: Colors.white)),
                const SizedBox(width: 5),
        
                // Question + answers stacked
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data['question'].toString(),style:GoogleFonts.lato(color: Colors.white)),
                    const SizedBox(height: 5),
                    Text('Correct: ${data['correct_answer']}',style:GoogleFonts.lato(color:Color.fromARGB(255,40, 148, 13) )),
                    const SizedBox(height: 5),

                    data['correct_answer']==data['user_answer']?Text('Your Answer: ${data['user_answer']}',style:GoogleFonts.lato(color:Color.fromARGB(255,40, 148, 13))):
                    Text('Your Answer: ${data['user_answer']}',style:GoogleFonts.lato(color:Color.fromARGB(255,219, 46, 72))) ,
                    const SizedBox(height: 10),
                  ],
                ),
              ],
            );
          }).toList(), // 👈 convert Iterable<Widget> to List<Widget>
        ),
      ),
    );
  }
}
