import 'package:app_gobarber/api/http_request.dart';
import 'package:app_gobarber/models/response_sign_in.dart';
import 'package:app_gobarber/models/user_credentials.dart';
import 'package:app_gobarber/pages/dashboard/dashboard.dart';
import 'package:app_gobarber/utils/shared_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'sign_in_store.g.dart';

class SignInStore = _SignInStoreBase with _$SignInStore;

abstract class _SignInStoreBase with Store {

  @observable
  UserCredentials userCredentails = UserCredentials();

  @observable
  bool loading = false;
  
  @action
  void setEmail(value){
    userCredentails.email = value;
  }

  @action
  void setPassword(value){
    userCredentails.password = value;
  }

  _showDialog(context, title, content){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: (){
                  Navigator.pop(context);
                },
              )
            ],
          );
        }
      );
  }

  @action
  Future login(context) async {
    loading = true;
    try{
      Response response = await HttpRequest().dio.post('/sessions', data: userCredentails.toJson());
      ResponseSignIn responseSignIn = ResponseSignIn.fromJson(response.data);
      if(responseSignIn.user.provider){
        _showDialog(context, "Falha no login", "O usuário não pode ser prestador de serviços");
        return;
      }
      await SharedUtils().setAuth(response.data);
      Navigator.pop(context);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> DashBoard()));
    }catch(e){
      _showDialog(context, "Falha no login", "Email/Password inválido(s)");
    }finally{
      loading = false;
    }
  }

}