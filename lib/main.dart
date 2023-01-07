import 'dart:ffi';
import 'package:flutter/material.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';
import 'dart:async';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const ScienceQuiz());
}

class ScienceQuiz extends StatelessWidget {
  const ScienceQuiz({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: ScienceQuizPage(),
        ),
      ),
    );
  }
}

class ScienceQuizPage extends StatefulWidget {
  @override
  _ScienceQuizPageState createState() => _ScienceQuizPageState();
}

class _ScienceQuizPageState extends State<ScienceQuizPage> {
  List<Icon> scoreKeeper = [];
  late AnimationController _animationController;
  late Animation _colorTween;
  var currentButtonColor = Color.fromRGBO(32, 30, 63, 1);

  bool checkAnswer(String userPickedAnswer) {
    String correctAnswer = quizBrain.getCorrectAnswer();
    //TODO: Step 6 - If we've not reached the end, ELSE do the answer checking steps below
    if (userPickedAnswer == correctAnswer) {
      return true;
    } else {
      return false;
    }

        quizBrain.nextQuestion();

  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return  Container(
        color:  Color.fromRGBO(23, 21, 43, 1),
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    quizBrain.getQuestionText(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  answerButton(0),
                  answerButton(1),
                  answerButton(2),
                  answerButton(3),
                ],
              ),
            ),
            Row(
              children: scoreKeeper,
            )
          ],
        ));
  }

  Widget answerButton(int answerNumber) {
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
                      }
                ),
              ),

              child: Text(
                quizBrain.getQuestionOptions()[answerNumber],
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () => setState(() {
                isCorrect = checkAnswer(quizBrain.getQuestionOptions()[answerNumber]);
                print(isCorrect);
                print(widget.hashCode);
                if (isCorrect) {
                  currentButtonColor = correctAnswerColor;
                } else {
                  currentButtonColor = wrongAnswerColor;
                }

                Timer(const Duration(seconds: 2), () {
                  print('CONTEXT $context');
                  print('Next Question Please');
                  setState(() {
                    currentButtonColor = defaultButtonColor;
                  });
                  if (quizBrain.isFinished()) {
                    quizBrain.reset();
                  } else {
                    quizBrain.nextQuestion();
                  }
                });
              }

              )
          ),
        ));
  }
}
