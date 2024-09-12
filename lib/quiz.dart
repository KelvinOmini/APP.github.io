import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/qustion_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/result_screen.dart';


class Quiz extends StatefulWidget {
  const Quiz({super.key});
  
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> _selectedAnswers = [];

  var _activeScreen = 'start-screen';

  void _switchScreen() {
    setState(() {
      _selectedAnswers = [];
      _activeScreen = 'questions-screen';
    });
  }

  void _chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        _activeScreen = "result-screen";
      });
    }
  }

  void restartQuiz() {
    setState(() {
      _selectedAnswers = [];
      _activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(_switchScreen);

    if (_activeScreen == 'questions-screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer: _chooseAnswer);
    }

    if (_activeScreen == "result-screen") {
      screenWidget = ResultScreen(
        choosenAnswers: _selectedAnswers,
        onRestart: restartQuiz,
        );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(66, 19, 8, 46),
                Color.fromARGB(221, 3, 7, 46),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
