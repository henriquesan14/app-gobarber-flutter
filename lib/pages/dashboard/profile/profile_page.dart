
import 'package:app_gobarber/stores/profile_store.dart';
import 'package:app_gobarber/widgets/container_gradient.dart';
import 'package:app_gobarber/widgets/input_field.dart';
import 'package:app_gobarber/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatelessWidget {
  final TextEditingController nameController= TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final FocusNode focusEmail = FocusNode();
  final FocusNode focusSenhaAtual = FocusNode();
  final FocusNode focusNovaSenha = FocusNode();
  final FocusNode focusConfirmSenha = FocusNode();
  final ProfileStore profileStore = ProfileStore();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    profileStore.getUser();
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
          child: Observer(
              builder: (_){
              return profileStore.loading ?
              Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
              :
              SingleChildScrollView(
                  child: Form(
                  key: _formKey,
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: 10,),
                    InputField(
                      // controller: nameController,
                      onChanged: profileStore.setName,
                      initialValue: profileStore.userUpdate.name,
                      autoCorrect: false,
                      hint: "Nome Completo",
                      validator: profileStore.validateName,
                      icon: Icon(FontAwesomeIcons.user, color: Colors.white),
                      inputAction: TextInputAction.next,
                      onSubmitted: (term){
                        FocusScope.of(context).requestFocus(focusEmail);
                      },
                    ),
                    SizedBox(height: 10),
                    InputField(
                      // controller: emailController,
                      onChanged: profileStore.setEmail,
                      initialValue: profileStore.userUpdate.email,
                      focus: focusEmail,
                      autoCorrect: false,
                      hint: "Informe seu e-mail",
                      validator: profileStore.validateEmail,
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
                      // controller: oldPasswordController,
                      onChanged: profileStore.setOldPassword,
                      focus: focusSenhaAtual,
                      autoCorrect: false,
                      hint: "Sua senha atual",
                      icon: Icon(FontAwesomeIcons.lock, color: Colors.white),
                      inputAction: TextInputAction.next,
                      onSubmitted: (term){
                        FocusScope.of(context).requestFocus(focusNovaSenha);
                      },
                      tipo: TextInputType.visiblePassword,
                      obscure: true
                    ),
                    SizedBox(height: 10),
                    InputField(
                      // controller: passwordController,
                      onChanged: profileStore.setPassword,
                      focus: focusNovaSenha,
                      autoCorrect: false,
                      hint: "Sua nova senha",
                      icon: Icon(FontAwesomeIcons.lock, color: Colors.white),
                      inputAction: TextInputAction.next,
                      onSubmitted: (term){
                        FocusScope.of(context).requestFocus(focusConfirmSenha);
                      },
                      tipo: TextInputType.visiblePassword,
                      obscure: true
                    ),
                    SizedBox(height: 10),
                    InputField(
                      // initialValue: "",
                      // controller: confirmPasswordController,
                      onChanged: profileStore.setConfirmPassword,
                      focus: focusConfirmSenha,
                      autoCorrect: false,
                      hint: "Confirmação de senha",
                      icon: Icon(FontAwesomeIcons.lock, color: Colors.white),
                      inputAction: TextInputAction.done,
                      onSubmitted: (term){
                        if(_formKey.currentState.validate()){
                          profileStore.updateUser(context);
                        }
                      },
                      tipo: TextInputType.visiblePassword,
                      obscure: true
                    ),
                    SizedBox(height: 15),
                    SubmitButton(
                      color: Color(0xff3b9eff),
                      onPressed: (){
                        if(_formKey.currentState.validate()){
                          profileStore.updateUser(context);
                        }
                      },
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
              },
              
          ),
        );
  }
}