import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key}); //forward key to superclass

  final void Function()
  startQuiz;
  //this.startquiz provides value for this variable
  //startQuiz is a function and takes no arguments and returns no value
  //same as switchscreen in quiz.dart
  //startquiz is an argument that contains a function as its value

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 200,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          // Opacity(
          //   opacity: 0.6,
          //     child: Image.asset('assets/images/quiz-logo.png', width: 300)),
          SizedBox(height: 20),
          Text(
            "Learn Flutter the fun way!",
            style: GoogleFonts.poppins(
              color: CupertinoColors.white,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 20),
          OutlinedButton.icon(
            //empty anonymous function,
            onPressed: startQuiz,

            style: OutlinedButton.styleFrom(
              foregroundColor: CupertinoColors.white,
            ),
            icon: const Icon(Icons.chevron_right),
            label:  Text("Start quiz", style: GoogleFonts.poppins(
              color: Colors.white
            ),),
          ),
        ],
      ),
    );
  }
}
