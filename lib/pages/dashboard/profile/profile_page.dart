
import 'package:app_gobarber/stores/profile_store.dart';
import 'package:app_gobarber/widgets/container_gradient.dart';
import 'package:app_gobarber/widgets/input_field.dart';
import 'package:app_gobarber/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatelessWidget {
  final FocusNode focusEmail = FocusNode();
  final FocusNode focusSenhaAtual = FocusNode();
  final FocusNode focusNovaSenha = FocusNode();
  final FocusNode focusConfirmSenha = FocusNode();
  final ProfileStore profileStore = ProfileStore();

  @override
  Widget build(BuildContext context) {
    return ContainerGradient(
          appBar: AppBar(
            title: Text(
              "Meu perfil",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 10,),
                InputField(
                  autoCorrect: false,
                  hint: "Nome Completo",
                  icon: Icon(FontAwesomeIcons.user, color: Colors.white),
                  inputAction: TextInputAction.next,
                  onSubmitted: (term){
                    FocusScope.of(context).requestFocus(focusEmail);
                  },
                ),
                SizedBox(height: 10),
                InputField(
                  focus: focusEmail,
                  autoCorrect: false,
                  hint: "Informe seu e-mail",
                  icon: Icon(FontAwesomeIcons.envelope, color: Colors.white),
                  inputAction: TextInputAction.next,
                  onSubmitted: (term){
                    FocusScope.of(context).requestFocus(focusSenhaAtual);
                  },
                ),
                Container(
                    margin: EdgeInsets.only(top: 30, bottom: 30),
                    child: Divider(
                    color: Color.fromRGBO(255, 255, 255, .2),
                    height: 1,
                  ),
                ),
                InputField(
                  focus: focusSenhaAtual,
                  autoCorrect: false,
                  hint: "Sua senha atual",
                  icon: Icon(FontAwesomeIcons.lock, color: Colors.white),
                  inputAction: TextInputAction.next,
                  onSubmitted: (term){
                    FocusScope.of(context).requestFocus(focusNovaSenha);
                  },
                ),
                SizedBox(height: 10),
                InputField(
                  focus: focusNovaSenha,
                  autoCorrect: false,
                  hint: "Sua nova senha",
                  icon: Icon(FontAwesomeIcons.lock, color: Colors.white),
                  inputAction: TextInputAction.next,
                  onSubmitted: (term){
                    FocusScope.of(context).requestFocus(focusConfirmSenha);
                  },
                ),
                SizedBox(height: 10),
                InputField(
                  focus: focusConfirmSenha,
                  autoCorrect: false,
                  hint: "Confirmação de senha",
                  icon: Icon(FontAwesomeIcons.lock, color: Colors.white),
                  inputAction: TextInputAction.done,
                ),
                SizedBox(height: 15),
                SubmitButton(
                  color: Color(0xff3b9eff),
                  onPressed: (){},
                  text: "Atualizar Perfil",
                ),
                SizedBox(height: 10,),
                SubmitButton(
                  color: Color(0xfff64c75),
                  onPressed: (){
                    profileStore.logout(context);
                  },
                  text: "Sair do GoBarber",
                )
              ],
            ),
          ),
        );
  }
}