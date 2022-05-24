import 'package:flutter/material.dart';
import 'package:trivia_quizzapp/routes/app_constants.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key, required this.text}) : super(key: key);

  String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      width: MediaQuery.of(context).size.width - 250,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
          textStyle: const TextStyle(fontSize: 14),
        ),
        onPressed: () {
          Navigator.pushNamed(context, RouterConstants.questionPage);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text.toString()),
            const SizedBox(
              width: 10,
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
