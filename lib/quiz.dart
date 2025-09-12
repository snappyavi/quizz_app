import 'package:flutter/material.dart';
import 'package:udemy_adv_basics/question_screen.dart';
import 'package:udemy_adv_basics/start_screen.dart';
import 'package:udemy_adv_basics/results_screen.dart';
import 'data/questions.dart';

class Quizz extends StatefulWidget {
  const Quizz({super.key});

  @override
  State<Quizz> createState() {
    //create State method returns a State value and refer to quiz widget class
    return _QuizzState(); //calls the auto generated _QuizState class constructed from the state class
  }
}

class _QuizzState extends State<Quizz> {
  //final is removed as the list needs to be rebooted every time the questions end
  //and new session begins
  List<String> selectedAnswers = [];

  var activeScreen = "StartScreeen";

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        //so if total no of answers saved = to total questions of the model
        //reboot the selected answers to empty list
        // selectedAnswers = []; this produced empty result screen for now
        activeScreen = 'ResultScreen';
      });
    }
  }

  //  //this requires us to add initState method
  //  //replace var with Widget to allow taking in widgets
  // Widget? activeScreen; //initially null but the widget is offered after initState is executed
  //
  // @override
  //  void initState() {
  //   //method creation and variable initialisation happens at same time
  //   //to tackle that we use initState
  //    //this runs after the build is executed
  //
  //   activeScreen = StartScreen(switchScreen);
  //    super.initState(); //makes sure that in the parent class aka State, initState is executed as well
  //  }

  void switchScreen() {
    //takes no argument, returns nothing
    setState(
      () {
        activeScreen = "QuestionScreen";
      },
    ); //setState enables build to re-execute the build method and update the UI
  }

  void restartQuiz(){
    setState(() {
      selectedAnswers=[];
      activeScreen="QuestionScreen";
    });
  }

  @override
  Widget build(context) {

    //this takes in pages
    //helps in navigation by comparing logic
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == "QuestionScreen"
    //comparison
    ) {
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
      //both onselectAnswer and chooseAnswer are of types String, they accept Answers
      //passing pointer to the function
    }

    if(activeScreen=="ResultScreen"){
      screenWidget= ResultScreen(chosenAnswers: selectedAnswers, onRestart: restartQuiz,);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [ Colors.deepPurpleAccent, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,

          //uses ternary operation or if-else operation
          // //if condition is true show start screen other question screen
          //     activeScreen == 'StartScreen'
          //         ? StartScreen(switchScreen)
          //         : QuestionScreen(), //child looks into the activescreen for widgets
        ),
      ),
    );
  }
}
