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
  
  @action
  void setEmail(value){
    userCredentails.email = value;
  }

  @action
  void setPassword(value){
    userCredentails.password = value;
  }

  @action
  Future login(context) async {
    try{
      Response response = await HttpRequest().dio.post('/sessions', data: userCredentails.toJson());
      await SharedUtils().setAuth(response.data);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> DashBoard()));
    }catch(e){
      showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Falha ao acessar"),
            content: Text("Email/password inválido(s)"),
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
  }

}