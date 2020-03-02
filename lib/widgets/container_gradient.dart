import 'package:flutter/material.dart';

class ContainerGradient  extends StatelessWidget {

  final Widget child;
  final double height;
  final AppBar appBar;

  ContainerGradient({this.child, this.height, this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffab59c1),
      appBar: appBar,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColor,
               Color(0xffab59c1),
            ]
          ),
        ),
        child: child
      ),
    );
  }
}