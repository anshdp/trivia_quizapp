import 'package:flutter/material.dart';
import 'package:trivia_quizzapp/quizz/widgets/custom_buton.dart';
import 'package:trivia_quizzapp/routes/app_constants.dart';

class FinalScore extends StatelessWidget {
  FinalScore({
    Key? key,
    this.score = 0,
  }) : super(key: key);

  int score;

  final TextStyle _textStyle =
      const TextStyle(color: Colors.black, fontSize: 25);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'TRIVIA APP',
          style: _textStyle,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Score Is',
              style: _textStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '$score/100',
              style: _textStyle,
            ),
            const SizedBox(
              height: 90,
            ),
            CustomButton(text: 'RETAKE TRIVIA')
          ],
        ),
      ),
    );
  }
}
