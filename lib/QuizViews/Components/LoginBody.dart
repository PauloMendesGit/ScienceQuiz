import 'package:flutter/material.dart';
import 'package:sciencequiz/QuizViews/main_quiz_view.dart';
import 'background_widget.dart';
import 'rounded_button.dart';

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Science Quiz",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 48.0,
            ),
          ),
          Image.asset('assets/images/loginbg.png', height: size.height * 0.4,),
          RoundedButton(size: size, text: "Login", buttonAction: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainQuizView()),
            );          },)
        ],
      ),
    );
  }
}

