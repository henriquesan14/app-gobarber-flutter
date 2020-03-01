import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  SubmitButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: RaisedButton(
        color: Color(0xff3b9eff),
        elevation: 0,
        onPressed: onPressed,
        child: Text(text,
        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))
      )
    );
  }
}