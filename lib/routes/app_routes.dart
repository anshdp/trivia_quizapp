import 'package:flutter/material.dart';
import 'package:trivia_quizzapp/quizz/final_screen.dart';
import 'package:trivia_quizzapp/quizz/home_screen.dart';
import 'package:trivia_quizzapp/quizz/question_screen.dart';
import 'package:trivia_quizzapp/routes/app_constants.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings route) {
    switch (route.name) {
      case RouterConstants.questionPage:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => QuestionScreen(),
        );
      case RouterConstants.finalPage:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => FinalScore(),
        );
      default:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => HomeScreen(),
        );
    }
  }
}
