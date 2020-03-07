import 'dart:convert';

import 'package:app_gobarber/api/http_request.dart';
import 'package:app_gobarber/models/response_sign_in.dart';
import 'package:app_gobarber/models/user_update.dart';
import 'package:app_gobarber/pages/signin/sign_in_page.dart';
import 'package:app_gobarber/utils/shared_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'profile_store.g.dart';

class ProfileStore = _ProfileStoreBase with _$ProfileStore;

abstract class _ProfileStoreBase with Store {

  @observable
  UserUpdate userUpdate = UserUpdate();
  
  @action
  void logout(context){
    SharedUtils().removeAuth();
    Navigator.pop(context);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignInPage()));
  }

  @action
  updateUser(context) async {
    try{
      Dio dio = await HttpRequest().getApi();
      Response response = await dio.put('/users', data: userUpdate.toJson());
      User user = User.fromJson(response.data);
      ResponseSignIn responseSignIn = ResponseSignIn();
      responseSignIn.user = user;
      String userStr = responseSignIn.toJson().toString();
      await SharedUtils().setAuth(json.decode(userStr));
      _showDialog(context, "Sucesso", "Perfil atualizado", (){
        Navigator.pop(context);
      });
    }on DioError catch(e){
      _showDialog(context, "Falha no login", "Email/Password inválido(s)", (){
        Navigator.pop(context);
      });
    }
  }

  @action
  setName(value){
    this.userUpdate.name = value;
  }

  @action
  setEmail(value){
    this.userUpdate.email = value;
  }

  @action
  setOldPassword(value){
    this.userUpdate.oldPassword = value;
  }

  @action
  setPassword(value){
    this.userUpdate.password = value;
  }

  @action
  setConfirmPassword(value){
    this.userUpdate.confirmPassword = value;
  }

  @action
  validateOldPassword(value){
    if((userUpdate.password != null || userUpdate.password != "") && value.isEmpty){
      return "Informe sua senha atual";
    }
    return null;
  }

  @action
  validatePassword(value){
    if((userUpdate.oldPassword != null || userUpdate.oldPassword != "") && value.isEmpty){
      return "Informe nova senha";
    }
    return null;
  }

  @action
  validateConfirmPassword(value){
    if((userUpdate.password != null || userUpdate.password != "") && value.isEmpty){
      return "Informe a confirmação da senha";
    }
    return null;
  }

  _showDialog(context, title, content, onPress){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: onPress,
              )
            ],
          );
        }
      );
  }


}