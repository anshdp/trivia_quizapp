import 'package:flutter/material.dart';
import 'package:trivia_quizzapp/quizz/home_screen.dart';
import 'package:trivia_quizzapp/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter().onGenerateRoute,
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        color: Color.fromARGB(255, 255, 255, 255),
      )),
      home: HomeScreen(),
    );
  }
}
