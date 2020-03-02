import 'package:app_gobarber/pages/dashboard/agendamentos/widgets/agendamento_tile.dart';
import 'package:app_gobarber/widgets/container_gradient.dart';
import 'package:flutter/material.dart';

class AgendamentosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContainerGradient(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: Text("Agendamentos",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        centerTitle: true,
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
    );
  }
}
