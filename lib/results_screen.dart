import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy_adv_basics/data/questions.dart';
import 'package:udemy_adv_basics/question_screen.dart';
import 'package:udemy_adv_basics/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final void Function() onRestart;

  final List<String> chosenAnswers;

  //getSummaryData is a list of Map of key - Value pairs of String and Object
  //all values in dart is object so its flexible
  //map can be used as a formula to store data in key-value pair
  List<Map<String, Object>> getSummaryData() {
    //empty list of same type
    final List<Map<String, Object>> summary = [];

    //helper variable; condition on how long should it run; condition to change
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        //outputs i reflect index of questions
        'question_index': i,
        //outputs questions by its index and get the text
        'question': questions[i].text,
        //the first answer of every question stored in question file is stored in correct answer key
        'correctAnswer': questions[i].answers[0],
        //index of chosen answers is stored in user answer to reference it to the list of answers that is stored
        'userAnswer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();

    final numTotalQuestions = questions.length;
    //total no. of question available from question.dart file
    final numCorrectQuestion =
        summaryData.where((data) {
          return data['userAnswer'] == data['correctAnswer'];
        }).length;

    //numCorrect uses summaryData ie getSummaryData Map
    // uses with .where() function to compare and if true add to list or false
    //where uses anonmyous function
    //compares both the answers and saves in the list
    //add .length to get the total no. of correct answers

    return SizedBox(
      width: double.infinity, //takes as much width as available //dynamic
      child: Container(
        padding: EdgeInsets.all(40),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestion out $numTotalQuestions questions correctly,',
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            QuestionSummary(summaryData),
            //questionSummary expects a list of Map values as an argument
            //declared on its page as well
            SizedBox(height: 30),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              icon: Icon(Icons.restart_alt_outlined),
              label: Text("Re-start Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
