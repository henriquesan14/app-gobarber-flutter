import 'package:app_gobarber/pages/dashboard/agendamentos/agendamentos_page.dart';
import 'package:app_gobarber/pages/dashboard/prestadores/prestador_page.dart';
import 'package:app_gobarber/pages/dashboard/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _currentIndex = 0;
  PageController _pageController = PageController();

  setCurrentIndex(index){
    if(index == 1){
      Navigator.push(context, MaterialPageRoute(builder: (context) => PrestadorPage()));
      return;
    }
    setState(() {
      _currentIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Color(0xffab59c1),
    body: PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: <Widget>[
        AgendamentosPage(),
        PrestadorPage(),
        ProfilePage(),
      ],
    ),
    bottomNavigationBar: Container(
        height: 80,
        child: BottomNavigationBar(
        backgroundColor: Color(0xff8d41a8),
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Color.fromRGBO(255, 255, 255, .6),
        onTap: setCurrentIndex,
        iconSize: 20,
        selectedFontSize: 17,
        unselectedFontSize: 16,
        items: [
          BottomNavigationBarItem(
            title: Text("Agendamentos"),
            icon: Icon(Icons.calendar_today)
          ),
          BottomNavigationBarItem(
            title: Text("Agendar"),
            icon: Icon(FontAwesomeIcons.calendarPlus),
          ),
          BottomNavigationBarItem(
            title: Text("Meu perfil"),
            icon: Icon(FontAwesomeIcons.user),
          )
        ],
      ),
    ),
      );
  }
}