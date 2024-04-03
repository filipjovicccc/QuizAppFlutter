import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizzappnew/data/questions.dart';
import 'package:quizzappnew/questions_screen.dart';
import 'package:quizzappnew/results_screen.dart';
import 'package:quizzappnew/start_screen.dart';


class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

 List<String> selectedAnswers = [];

  var activeScreen = 'start-screen';


  void switchScreen(){
    
    setState(() {
        activeScreen = 'questions-screen';
    });

  }

  void chooseAnswer (String answer){

    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length){
        setState((){
     
          activeScreen = 'results-screen';
        });
    }

  }

  void restartQuiz(){
    setState((){
       selectedAnswers = [];
       activeScreen = 'start-screen';
    });
  }


  @override
  Widget build(BuildContext context) {

   Widget screenWidget =  StartScreen(switchScreen);


   if(activeScreen == 'questions-screen'){
         
         selectedAnswers = [];
        screenWidget =  QuestionScreen(onSelectAnswer: chooseAnswer);
   }


if(activeScreen == 'results-screen'){

  screenWidget =  ResultsScreen(
    chosenAnswers: selectedAnswers,
    onRestart: restartQuiz
  
  );
}

    return MaterialApp(
    home: Scaffold(

      body:Container(
        decoration:const  BoxDecoration(
          gradient: LinearGradient(
            colors: [
                Color.fromARGB(255, 158, 39, 179),
               Color.fromARGB(255, 19, 24, 155),
              
            ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
          )
        ),
        child: screenWidget,
      )
    ),
  );
  }
}