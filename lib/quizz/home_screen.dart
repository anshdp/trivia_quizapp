import 'package:flutter/material.dart';
import 'package:trivia_quizzapp/quizz/widgets/custom_buton.dart';
import 'package:trivia_quizzapp/routes/app_constants.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'TRIVIA APP',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              text: 'TAKE TRIVIA',
            )
          ],
        ),
      ),
    );
  }
}
