import 'package:app_gobarber/pages/signin/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'pages/signin/sign_in_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
      home: SignInPage(),
    );
  }
}
