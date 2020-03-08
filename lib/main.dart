import 'package:app_gobarber/models/auth_status.dart';
import 'package:app_gobarber/pages/dashboard/dashboard.dart';
import 'package:app_gobarber/pages/signin/sign_in_page.dart';
import 'package:app_gobarber/stores/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


import 'pages/signin/sign_in_page.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget{
  final AuthStore authStore = AuthStore();

  Widget _buildHomeScreen(authStatus, context){
    switch(authStatus){
      case AuthStatus.NOT_DETERMINED:
        return Container(
          decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff7159c1),
                    Color(0xffab59c1)
                  ]
                ),
          ),
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          )
        );
      case AuthStatus.NOT_LOGGED_IN:
        return SignInPage();
      case AuthStatus.LOGGED:
        return DashBoard();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    authStore.getStatus();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xff7159c1)
    ));
    return MaterialApp(
      title: 'App GoBarber',
      theme: ThemeData(
        primaryColor: Color(0xff7159c1),
      ),
      debugShowCheckedModeBanner: false,
      home: Observer(
        builder: (_){
          return _buildHomeScreen(authStore.authStatus, context);
        },
      )
    );
  }
}
