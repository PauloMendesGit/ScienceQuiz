import 'package:flutter/material.dart';
import '../QuizViewModel/quiz_brain.dart';
import 'package:sciencequiz/question.dart';
import 'dart:async';

final QuizBrain quizBrain = QuizBrain();

class MainQuizView extends StatefulWidget {
  @override
  _MainQuizViewState createState() => _MainQuizViewState();
}

class _MainQuizViewState extends State<MainQuizView> {
  List<Icon> scoreKeeper = [];
  var firstButtonColorDefault = Color.fromRGBO(32, 30, 63, 1);
  var secondButtonColorDefault = Color.fromRGBO(32, 30, 63, 1);
  var thirdButtonColorDefault = Color.fromRGBO(32, 30, 63, 1);
  var forthButtonColorDefault = Color.fromRGBO(32, 30, 63, 1);
  var defaultButtonColor = Color.fromRGBO(32, 30, 63, 1);
  var areActionsEnabled = true;
  List<Question> quizChallenge = quizBrain.getQuizChallenge(20);

  bool checkAnswer(String userPickedAnswer) {
    String correctAnswer = quizBrain.getCorrectAnswer(quizChallenge);
    if (userPickedAnswer == correctAnswer) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(32, 30, 63, 1),
          title: const Text('Science Quiz'),
      ),
      body: Container(
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
                    quizBrain.getQuestionText(quizChallenge),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 28.0,
                      color: Colors.white
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
/*
                  AnswerButton(answerNumber: 0),
                  AnswerButton(answerNumber: 1),
                  AnswerButton(answerNumber: 2),
                  AnswerButton(answerNumber: 3),
*/
                  answerButtonFirst(),
                  answerButtonSecond(),
                  answerButtonThird(),
                  answerButtonFourth(),
                ],
              ),
            ),
            Row(
              children: scoreKeeper,
            )
          ],
        )));
  }

  Widget answerButtonFirst() {
    var correctAnswerColor = Color.fromRGBO(0, 190, 180, 1);
    var wrongAnswerColor = Color.fromRGBO(200, 55, 70, 1);
    var isCorrect = false;
    var buttonNumber = 0;

    return Expanded(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(firstButtonColorDefault),
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      return firstButtonColorDefault;
                    }
                ),
              ),

              child: Text(
                quizBrain.getQuestionOptions(quizChallenge)[buttonNumber],
                style: TextStyle(fontSize: 24),
              ),
              onPressed: areActionsEnabled ? () => setState(() {
                areActionsEnabled = false;
                isCorrect = checkAnswer(quizBrain.getQuestionOptions(quizChallenge)[buttonNumber]);
                print(isCorrect);
                if (isCorrect) {
                  firstButtonColorDefault = correctAnswerColor;
                } else {
                  firstButtonColorDefault = wrongAnswerColor;
                }

                Timer(const Duration(seconds: 2), () {
                  print('Next Question Please');
                  areActionsEnabled = true;
                  setState(() {
                    firstButtonColorDefault = defaultButtonColor;
                  });
                  if (quizBrain.isFinished(quizChallenge)) {
                    quizBrain.reset();
                  } else {
                    quizBrain.nextQuestion(quizChallenge);
                  }
                });
              }) : null),
        ));
  }
  Widget answerButtonSecond() {
    var correctAnswerColor = Color.fromRGBO(0, 190, 180, 1);
    var wrongAnswerColor = Color.fromRGBO(200, 55, 70, 1);
    var isCorrect = false;
    var buttonNumber = 1;

    return Expanded(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(secondButtonColorDefault),
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      return secondButtonColorDefault;
                    }
                ),
              ),

              child: Text(
                quizBrain.getQuestionOptions(quizChallenge)[buttonNumber],
                style: TextStyle(fontSize: 24),
              ),
              onPressed: areActionsEnabled ? () => setState(() {
                areActionsEnabled = false;
                isCorrect = checkAnswer(quizBrain.getQuestionOptions(quizChallenge)[buttonNumber]);
                print(isCorrect);
                if (isCorrect) {
                  secondButtonColorDefault = correctAnswerColor;
                } else {
                  secondButtonColorDefault = wrongAnswerColor;
                }
                setState(() {});

                Timer(const Duration(seconds: 2), () {
                  print('Next Question Please');
                  areActionsEnabled = true;
                  setState(() {
                    secondButtonColorDefault = defaultButtonColor;
                  });
                  if (quizBrain.isFinished(quizChallenge)) {
                    quizBrain.reset();
                  } else {
                    quizBrain.nextQuestion(quizChallenge);
                  }
                });
              }) : null),
        ));
  }
  Widget answerButtonThird() {
    var correctAnswerColor = Color.fromRGBO(0, 190, 180, 1);
    var wrongAnswerColor = Color.fromRGBO(200, 55, 70, 1);
    var isCorrect = false;
    var buttonNumber = 2;

    return Expanded(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(thirdButtonColorDefault),
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      return thirdButtonColorDefault;
                    }
                ),
              ),

              child: Text(
                quizBrain.getQuestionOptions(quizChallenge)[buttonNumber],
                style: TextStyle(fontSize: 24),
              ),
              onPressed: areActionsEnabled ? () => setState(() {
                areActionsEnabled = false;
                isCorrect = checkAnswer(quizBrain.getQuestionOptions(quizChallenge)[buttonNumber]);
                print(isCorrect);
                if (isCorrect) {
                  thirdButtonColorDefault = correctAnswerColor;
                } else {
                  thirdButtonColorDefault = wrongAnswerColor;
                }

                Timer(const Duration(seconds: 2), () {
                  print('Next Question Please');
                  areActionsEnabled = true;
                  setState(() {
                    thirdButtonColorDefault = defaultButtonColor;
                  });
                  if (quizBrain.isFinished(quizChallenge)) {
                    quizBrain.reset();
                  } else {
                    quizBrain.nextQuestion(quizChallenge);
                  }
                });
              }) : null),
        ));
  }
  Widget answerButtonFourth() {
    var correctAnswerColor = Color.fromRGBO(0, 190, 180, 1);
    var wrongAnswerColor = Color.fromRGBO(200, 55, 70, 1);
    var isCorrect = false;
    var buttonNumber = 3;

    return Expanded(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(forthButtonColorDefault),
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      return forthButtonColorDefault;
                    }
                ),
              ),

              child: Text(
                quizBrain.getQuestionOptions(quizChallenge)[buttonNumber],
                style: TextStyle(fontSize: 24),
              ),
              onPressed: areActionsEnabled ? () => setState(() {
                areActionsEnabled = false;
                isCorrect = checkAnswer(quizBrain.getQuestionOptions(quizChallenge)[buttonNumber]);
                print(isCorrect);
                if (isCorrect) {
                  forthButtonColorDefault = correctAnswerColor;
                } else {
                  forthButtonColorDefault = wrongAnswerColor;
                }

                Timer(const Duration(seconds: 2), () {
                  print('Next Question Please');
                  areActionsEnabled = true;
                  setState(() {
                    forthButtonColorDefault = defaultButtonColor;
                  });
                  if (quizBrain.isFinished(quizChallenge)) {
                    quizBrain.reset();
                  } else {
                    quizBrain.nextQuestion(quizChallenge);
                  }
                });
              }) : null),
        ));
  }
}
