import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Ansbutton extends StatelessWidget{
  Ansbutton(this.Intext,this.onTap,{super.key});
  final void Function() onTap;
  final String Intext;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed:onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255,161, 114, 34),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: Text(Intext,style: TextStyle(color: Colors.white),textAlign: TextAlign.center),
    );
  }

}