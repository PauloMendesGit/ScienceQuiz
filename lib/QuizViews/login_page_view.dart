import 'package:flutter/material.dart';
import 'Components/LoginBody.dart';

class LoginPageView extends StatefulWidget {
  @override
  _LoginPageViewState createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            LoginBody(),
          ])
    );
  }
}