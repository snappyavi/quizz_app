import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udemy_adv_basics/answer_button.dart';
import 'package:udemy_adv_basics/data/questions.dart';
import 'package:udemy_adv_basics/models/quiz_question.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  //this is defined in state class

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  //to manage the state of question after clicking on answer
  var currentQuestionIndex = 0;

  //method
  void answerQuestion(String selectedAnswer) {
    //widget property helps to access the method defined in the Widget class of stateful widget
    //to find out what are answer is?
    // we pass onSelectAnswer of type string  as argument with answerQuestion
    //this saves the onselectAnswer
    //this passess the data to onSelecteAnswer and to chooseAnswer in the quiz file to add that to the list
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    //offers index of questions from the list
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity, //takes as much width as available //dynamic
      child: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            //(...) spreading values = converts list into individual elements
            //map function helps to converts list to other values => like answer list to individual widgets
            // => answer button here
            //the answer buttons are made with the help of answers list here

            //  getShuffledAnswer = shuffles the buttons based on the shuffled list of answers
            ...currentQuestion.getShuffledAnswer().map((answer) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: AnswerButton(
                  onTap: () {
                    //different for every button
                    //passes answer as value to ontap
                    //code is triggered only when tapped
                    answerQuestion(answer);
                  },
                  answerText: answer,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
