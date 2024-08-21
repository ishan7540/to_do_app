import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  MyButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
          elevation: 5,
          onPressed: onPressed,
          color: Colors.amberAccent,
          child: Text(text)),
    );
  }
}
