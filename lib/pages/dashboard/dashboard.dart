import 'package:app_gobarber/pages/dashboard/agendamentos/agendamentos_page.dart';
import 'package:app_gobarber/pages/dashboard/profile/profile_page.dart';
import 'package:app_gobarber/stores/dashboard_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class DashBoard extends StatelessWidget {

  final DashBoardStore dashboardStore = DashBoardStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffab59c1),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: dashboardStore.pageController,
        children: <Widget>[
          AgendamentosPage(),
          Container(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: Observer(builder: (context) {
        return Container(
          height: 80,
          child: BottomNavigationBar(
            backgroundColor: Color(0xff8d41a8),
            currentIndex: dashboardStore.currentPage,
            selectedItemColor: Colors.white,
            unselectedItemColor: Color.fromRGBO(255, 255, 255, .6),
            onTap: (index) {
              dashboardStore.setPage(context, index);
            },
            iconSize: 20,
            selectedFontSize: 17,
            unselectedFontSize: 16,
            items: [
              BottomNavigationBarItem(
                  title: Text("Agendamentos"),
                  icon: Icon(Icons.calendar_today)),
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
        );
      }),
    );
  }
}
