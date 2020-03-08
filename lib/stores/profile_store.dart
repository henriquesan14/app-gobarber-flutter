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
  @observable
  bool loading = false;
  
  @action
  void logout(context){
    SharedUtils().removeAuth();
    Navigator.pop(context);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignInPage()));
  }

  @action
  updateUser(context) async {
    try{
      dynamic body;
      Dio dio = await HttpRequest().getApi();
      if(userUpdate.password == null || userUpdate.password.isEmpty){
        body  = {
          "name": userUpdate.name,
          "email": userUpdate.email
        }; 
      }else{
        body  = {
          "name": userUpdate.name,
          "email": userUpdate.email,
          "oldPassword": userUpdate.oldPassword,
          "password": userUpdate.password,
          "confirmPassword": userUpdate.confirmPassword
        }; 
      }
      Response response = await dio.put('/users', data: body);
      User user = User.fromJson(response.data);
      ResponseSignIn responseSignIn = await SharedUtils().getAuth();
      responseSignIn.user = user;
      dynamic userStr = responseSignIn.toJson();
      String userJson = json.encode(userStr);
      dynamic a = json.decode(userJson);
      await SharedUtils().setAuth(a);
      _showDialog(context, "Sucesso", "Perfil atualizado", (){
        
        Navigator.pop(context);
      });
    }on DioError catch(e){
      _showDialog(context, "Falha", e.response.data['error'], (){
        Navigator.pop(context);
      });
    }
  }

  

  @action
  getUser() async {
    loading = true;
    try{
      ResponseSignIn responseSignIn = await SharedUtils().getAuth();
      userUpdate.name = responseSignIn.user.name;
      userUpdate.email = responseSignIn.user.email;
    }catch(e){
      print(e);
    }finally{
      loading = false;
    }
  }

  @action
  setName(value){
    userUpdate.name = value;
  }

  @action
  setEmail(value){
    userUpdate.email = value;
  }

  @action
  setOldPassword(value){
    userUpdate.oldPassword = value;
  }

  @action
  setPassword(value){
    userUpdate.password = value;
  }

  @action
  setConfirmPassword(value){
    userUpdate.confirmPassword = value;
  }

  @action
  String validateName(value){
    if(value.isEmpty){
      return "Informe o nome";
    }
    return null;
  }

  @action
  String validateEmail(value){
    if(value.isEmpty){
      return "Informe o e-mail";
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