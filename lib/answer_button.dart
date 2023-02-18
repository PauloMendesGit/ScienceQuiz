/*
import 'package:flutter/material.dart';
import 'QuizViews/main_quiz_view.dart';
import 'main.dart';
import 'dart:async';

class _AnswerButtonState extends State<AnswerButton> {
  final Color correctAnswerColor = const Color.fromRGBO(0, 190, 180, 1);
  final Color wrongAnswerColor = const Color.fromRGBO(200, 55, 70, 1);
  var currentButtonColor = Color.fromRGBO(32, 30, 63, 1);

  bool checkAnswer(String userPickedAnswer) {
    String correctAnswer = quizBrain.getCorrectAnswer();

    print("Correct Answer: $correctAnswer");
    print("User picked Answer: $userPickedAnswer");

    if (userPickedAnswer == correctAnswer) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var defaultButtonColor = Color.fromRGBO(32, 30, 63, 1);
    var correctAnswerColor = Color.fromRGBO(0, 190, 180, 1);
    var wrongAnswerColor = Color.fromRGBO(200, 55, 70, 1);
    var isCorrect = false;

    return Expanded(
        child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(currentButtonColor),
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      return currentButtonColor;
                    }),
              ),
              onPressed: () => setState(() {
                isCorrect = checkAnswer(quizBrain.getQuestionOptions(quizChallenge)[widget.answerNumber]);
                print(isCorrect);
                if (isCorrect) {
                  currentButtonColor = correctAnswerColor;
                } else {
                  currentButtonColor = wrongAnswerColor;
                }

                Timer(const Duration(seconds: 2), () {
                  print('Next Question Please');
                  currentButtonColor = defaultButtonColor;
                  if (quizBrain.isFinished(quizChallenge)) {
                    quizBrain.reset();
                  } else {
                    quizBrain.nextQuestion(quizChallenge);
                  }
                  setState(() {});
                });
                setState(() {});
              }),
              child: Text(quizBrain.getQuestionOptions()[widget.answerNumber],
                style: TextStyle(fontSize: 24),
              ),
            )));
  }
}


class AnswerButton extends StatefulWidget {
  final int answerNumber;

  const AnswerButton({Key? key, required this.answerNumber}) : super(key: key);
  @override
  _AnswerButtonState createState() => _AnswerButtonState();
}
*/
