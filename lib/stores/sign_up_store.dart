import 'package:app_gobarber/api/http_request.dart';
import 'package:app_gobarber/models/response_sign_in.dart';
import 'package:app_gobarber/models/user_register.dart';
import 'package:app_gobarber/pages/dashboard/dashboard.dart';
import 'package:app_gobarber/pages/signin/sign_in_page.dart';
import 'package:app_gobarber/utils/shared_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'sign_up_store.g.dart';

class SignUpStore = _SignUpStoreBase with _$SignUpStore;

abstract class _SignUpStoreBase with Store {

  @observable
  UserRegister userRegister = UserRegister();

  @observable
  bool loading = false;

  @action
  void setNome(value){
    userRegister.name = value;
  }

  @action
  void setEmail(value){
    userRegister.email = value;
  }

  @action
  void setPassword(value){
    userRegister.password = value;
  }


  @action
  Future register(context) async {
    loading = true;
    try{
      Dio dio = await HttpRequest().getApi();
      Response response = await dio.post('/users', data: userRegister.toJson());
      if(response.statusCode == 200){
        _showDialog(context, "Sucesso", "Cadastrado com sucesso", (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignInPage()));
        });
      }
    }on DioError catch(e){
      _showDialog(context, "Falha no cadastro", e.response.data['error'], (){
        Navigator.pop(context);
      });
    }finally{
      loading = false;
    }
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