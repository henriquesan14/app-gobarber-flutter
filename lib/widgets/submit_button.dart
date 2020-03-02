import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;

  SubmitButton({this.text, this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: RaisedButton(
        color: color,
        elevation: 0,
        onPressed: onPressed,
        child: Text(text,
        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))
      )
    );
  }
}