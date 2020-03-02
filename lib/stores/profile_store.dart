import 'package:app_gobarber/pages/signin/sign_in_page.dart';
import 'package:app_gobarber/utils/shared_utils.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'profile_store.g.dart';

class ProfileStore = _ProfileStoreBase with _$ProfileStore;

abstract class _ProfileStoreBase with Store {
  
  @action
  void logout(context){
    SharedUtils().removeAuth();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignInPage()));
  }
}