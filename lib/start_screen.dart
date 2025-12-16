import 'package:flutter/material.dart';
class StartScreen extends StatelessWidget {
  const StartScreen(this.switchscreen,{super.key});
  final void Function() switchscreen;
  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
              opacity: 0.7, child: Image.asset('assets/images/quiz-logo.png')),
          const SizedBox(height: 40),
          Text('Learn Flutter the fun way',
              style: TextStyle(color: Colors.white, fontSize: 24)),
          const SizedBox(height: 40),
          OutlinedButton.icon(
            onPressed: switchscreen,
            style: TextButton.styleFrom(
                foregroundColor: Colors.white, side: BorderSide.none),
            icon: const Icon(Icons.arrow_forward_rounded),
            label: const Text('Start Quiz'),
          )

        ]),
    );
  }
}