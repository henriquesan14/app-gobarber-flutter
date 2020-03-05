import 'package:app_gobarber/models/auth_status.dart';
import 'package:app_gobarber/pages/dashboard/dashboard.dart';
import 'package:app_gobarber/pages/signin/sign_in_page.dart';
import 'package:app_gobarber/utils/shared_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'pages/signin/sign_in_page.dart';

void main() => runApp(MyApp());


Widget _buildWaitingScreen() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.blueAccent,
        ),
      ),
    );
  }

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  

  @override
  void initState() {
    super.initState();
    getUser().then((auth){
      setState(() {
        authStatus = auth;
      });
    });
  }

  Future<AuthStatus> getUser() async {
    bool isLogged = await SharedUtils().check();
    if(isLogged){
        return authStatus = AuthStatus.LOGGED;
    }
    return AuthStatus.NOT_LOGGED_IN;
  }

  Widget view(){
    switch(authStatus){
      case AuthStatus.NOT_DETERMINED:
        return Container(
          color: Color(0xff7159c1),
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xff7159c1)
    ));
    return MaterialApp(
      title: 'App GoBarber',
      theme: ThemeData(
        primaryColor: Color(0xff7159c1),
      ),
      debugShowCheckedModeBanner: false,
      home: view()
    );
  }
}
