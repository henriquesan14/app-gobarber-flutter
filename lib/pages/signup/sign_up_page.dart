import 'package:app_gobarber/stores/sign_up_store.dart';
import 'package:app_gobarber/widgets/input_field.dart';
import 'package:app_gobarber/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignUpPage extends StatelessWidget {
  final FocusNode focusEmail = FocusNode();
  final FocusNode focusSenha = FocusNode();
  final SignUpStore signUpStore = SignUpStore();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffab59c1),
        body: Observer(
          builder: (_){
            return ModalProgressHUD(
              inAsyncCall: signUpStore.loading,
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
                onChanged: signUpStore.setNome,
                hint: "Nome completo",
                icon: Icon(FontAwesomeIcons.user, color: Colors.white),
                obscure: false,
                tipo: TextInputType.text,
                inputAction: TextInputAction.next,
                onSubmitted: (term){
                  FocusScope.of(context).requestFocus(focusEmail);
                },
                validator: (value){
                      if(value.isEmpty){
                        return "Informe um nome";
                      }
                      return null;
                    },
              ),
              SizedBox(height: 10),
              InputField(
                onChanged: signUpStore.setEmail,
                focus: focusEmail,
                hint: "Digite seu e-mail",
                icon: Icon(FontAwesomeIcons.envelope, color: Colors.white),
                obscure: false,
                tipo: TextInputType.emailAddress,
                inputAction: TextInputAction.next,
                onSubmitted: (term){
                  FocusScope.of(context).requestFocus(focusSenha);
                },
                validator: (value){
                      if(value.isEmpty){
                        return "Informe um e-mail";
                      }
                      return null;
                    },
              ),
              SizedBox(height: 10),
              InputField(
                onChanged: signUpStore.setPassword,
                focus: focusSenha,
                hint: "Sua senha secreta",
                icon: Icon(FontAwesomeIcons.lock, color: Colors.white),
                obscure: true,
                tipo: TextInputType.visiblePassword,
                inputAction: TextInputAction.done,
                onSubmitted: (term){
                  if(_formKey.currentState.validate()){
                    signUpStore.register(context);
                  }
                },
                validator: (value){
                      if(value.isEmpty){
                          return "Informe a senha";
                        }else if(value.length < 6){
                          return "Senha precisa ter 6 caracteres";
                        }
                        return null;
                    },
              ),
              SizedBox(height: 10),
              SubmitButton(
                color: Color(0xff3b9eff),
                text: "Cadastrar",
                onPressed: (){
                  if(_formKey.currentState.validate()){
                    signUpStore.register(context);
                  }
                },
              ),
              SizedBox(height: 20),
              Center(
                child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Text("Já possui uma conta? Entre agora",
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
          },
        ) 
    );
  }
}