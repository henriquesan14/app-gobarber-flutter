
import 'package:app_gobarber/pages/dashboard/dashboard.dart';
import 'package:app_gobarber/pages/signup/sign_up_page.dart';
import 'package:app_gobarber/widgets/input_field.dart';
import 'package:app_gobarber/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInPage extends StatelessWidget {
  final FocusNode focusSenha = FocusNode();
  @override
  Widget build(BuildContext context) {
    final mq = MediaQueryData.fromWindow(window);
    return Scaffold(
      backgroundColor: Color(0xffab59c1),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: mq.size.height,
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
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset('assets/logo.png', height: 130),
              SizedBox(height: 30),
              InputField(
                hint: "Digite seu e-mail",
                icon: Icon(FontAwesomeIcons.envelope, color: Colors.white),
                obscure: false,
                tipo: TextInputType.emailAddress,
                inputAction: TextInputAction.next,
                onSubmitted: (term){
                  FocusScope.of(context).requestFocus(focusSenha);
                }
              ),
              SizedBox(height: 10),
              InputField(
                focus: focusSenha,
                hint: "Sua senha secreta",
                icon: Icon(FontAwesomeIcons.lock, color: Colors.white),
                obscure: true,
                tipo: TextInputType.visiblePassword,
                inputAction: TextInputAction.done,
                onSubmitted: (term){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> DashBoard()));
                },
              ),
              SizedBox(height: 10),
              SubmitButton(
                color: Color(0xff3b9eff),
                text: "Acessar",
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> DashBoard()));
                },
              ),
              SizedBox(height: 20),
              Center(
                child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                    },
                    child: Text("Criar conta gratuita",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  )),
                )
              )
            ],
          )
        )
      )
    );
  }
}