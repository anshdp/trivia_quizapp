import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trivia_quizzapp/quizz/final_screen.dart';

Future<List<dynamic>> fetchQuestions() async {
  var result = await http.get(
    Uri.parse(
      "https://opentdb.com/api.php?amount=10&difficulty=easy&type=multiple",
    ),
  );

  var data = await jsonDecode(result.body)['results'];

  return data;
}

class QuestionScreen extends StatefulWidget {
  QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late Future<List<dynamic>> questionData;

  int i = 0;

  String? enteredAnswer;

  int totalScore = 0;

  @override
  void initState() {
    super.initState();
    questionData = fetchQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'TRIVIA APP',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: FutureBuilder(
        future: questionData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List questions = snapshot.data;

            List incorrectAnswers = questions[i]['incorrect_answers'];

            String correctAnswer = questions[i]['correct_answer'];

            List options = [correctAnswer];

            options.addAll(incorrectAnswers);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Question ${i + 1}',
                        style:
                            const TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                      Text(
                        questions[i]['question'].toString(),
                        style: const TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height - 500,
                  child: ListView.builder(
                    itemCount: options.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(options[index]),
                        leading: Radio<dynamic>(
                            value: options[index],
                            groupValue: enteredAnswer,
                            onChanged: (value) {
                              setState(() {
                                enteredAnswer = value.toString();
                              });
                            }),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    color: Colors.amber,
                    width: MediaQuery.of(context).size.width - 250,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        if (correctAnswer == enteredAnswer) {
                          totalScore += 10;
                        }

                        if (i < questions.length - 1) {
                          setState(() {
                            i++;
                          });
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  FinalScore(score: totalScore),
                            ),
                          );
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Next'),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
