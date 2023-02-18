import 'package:flutter/material.dart';
import 'package:sciencequiz/QuizViews/login_page_view.dart';
import 'package:sciencequiz/constants.dart';

// https://www.youtube.com/watch?v=ExKYjqgswJg

void main() => runApp(ScienceQuiz());

class ScienceQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: LoginPageView(),
    );
  }
}
