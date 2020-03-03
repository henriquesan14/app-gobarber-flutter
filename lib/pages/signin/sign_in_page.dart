
import 'package:app_gobarber/pages/dashboard/dashboard.dart';
import 'package:app_gobarber/pages/signup/sign_up_page.dart';
import 'package:app_gobarber/stores/sign_in_store.dart';
import 'package:app_gobarber/widgets/input_field.dart';
import 'package:app_gobarber/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignInPage extends StatelessWidget {
  final FocusNode focusSenha = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final SignInStore signInStore = SignInStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffab59c1),
        body: Observer(
            builder: (_){
            return ModalProgressHUD(
              inAsyncCall: signInStore.loading,
              opacity: 0.3,
              progressIndicator: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
              child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
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
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Image.asset('assets/logo.png', height: 130),
                    SizedBox(height: 30),
                    InputField(
                      onChanged: signInStore.setEmail,
                      controller: _emailController,
                      validator: (value){
                        if(value.isEmpty){
                          return "Informe o e-mail";
                        }
                        return null;
                      },
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
                      onChanged: signInStore.setPassword,
                      controller: _senhaController,
                      validator: (value){
                        if(value.isEmpty){
                          return "Informe a senha";
                        }else if(value.length < 6){
                          return "Senha precisa ter 6 caracteres";
                        }
                        return null;
                      },
                      focus: focusSenha,
                      hint: "Sua senha secreta",
                      icon: Icon(FontAwesomeIcons.lock, color: Colors.white),
                      obscure: true,
                      tipo: TextInputType.visiblePassword,
                      inputAction: TextInputAction.done,
                      onSubmitted: (term){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> DashBoard()));
                      },
                    ),
                    SizedBox(height: 10),
                    SubmitButton(
                      color: Color(0xff3b9eff),
                      text: "Acessar",
                      onPressed: (){
                        if(_formKey.currentState.validate()){
                          signInStore.login(context);
                        }
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
                    ),
                  ],
                )
              ),
          ),
            );
            }
        )
      );
  }
}