import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.size, required this.text, required this.buttonAction,
  }) : super(key: key);

  final Size size;
  final String text;
  final Function buttonAction;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size.width * 0.8,
        height: size.height * 0.06,
        child: ElevatedButton(
          onPressed: () {
            buttonAction();
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
            ),
          ),
        )
    );
  }
}
