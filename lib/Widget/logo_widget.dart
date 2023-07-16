import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: Align(
        alignment: Alignment.topLeft,
        child: Image.asset(
          "assets/images/logo.png",
          width: 50,
          height: 50,
        ),
      ),
    );
  }
}
