import 'dart:convert';

import 'package:app_gobarber/models/response_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedUtils {

  setAuth(dynamic auth) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('auth', json.encode(auth));
  }

  Future<ResponseSignIn> getAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String authStr = prefs.getString('auth');
    return ResponseSignIn.fromJson(json.decode(authStr));
  }

  removeAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('auth');
  }
}