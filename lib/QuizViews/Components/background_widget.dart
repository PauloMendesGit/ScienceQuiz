import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;
  const BackgroundWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: size.width / 3 * -1,
            left: size.width / 6 * -1,
            child: Image.asset('assets/images/ball.png',
              width: size.width * 1,
            ),
          ),
          Positioned(
            bottom: size.width / 2.5 * -1,
            left: size.width / 4 * -1,
            child: Image.asset('assets/images/ball.png',
              width: size.width,
            ),
          ),
          Positioned(
            top: size.width / 3,
            left: size.width / 4,
            child: Image.asset('assets/images/ball.png',
              width: size.width,
            ),
          ),
          child,
        ],
      ),
    );

  }
}