import 'package:app_gobarber/pages/dashboard/agendamentos/widgets/agendamento_tile.dart';
import 'package:flutter/material.dart';

class AgendamentosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: Text("Agendamentos",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold
        )),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).primaryColor,
                Color(0xffab59c1),
              ]
            ),
          ),
          child: ListView(
            children: <Widget>[
              AgendamentoTile(),
              AgendamentoTile(),
              AgendamentoTile(),
              AgendamentoTile(),
              AgendamentoTile(),
              AgendamentoTile(),
              AgendamentoTile(),
              AgendamentoTile(),
              AgendamentoTile(),
              AgendamentoTile(),
              AgendamentoTile(),
              AgendamentoTile(),
              AgendamentoTile(),
              AgendamentoTile(),
              AgendamentoTile(),
              AgendamentoTile(),
              AgendamentoTile(),
              AgendamentoTile(),
              AgendamentoTile(),
            ],
          ),
      ),
    );
  }
}