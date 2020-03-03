import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

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