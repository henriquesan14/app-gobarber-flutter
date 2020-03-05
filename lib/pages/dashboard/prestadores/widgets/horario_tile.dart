import 'package:app_gobarber/models/horario.dart';
import 'package:app_gobarber/pages/dashboard/prestadores/confirm_agendamento_page.dart';
import 'package:flutter/material.dart';

class HorarioTile extends StatelessWidget {
  final Horario horario;

  HorarioTile(this.horario);

  _goConfirmAgendamento(context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmAgendamentoPage()));
  }
  

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: horario.available ? (){
          _goConfirmAgendamento(context);
        } : null,
        child: Container(
          margin: EdgeInsets.only(bottom: 18),
          decoration: BoxDecoration(
              color:
              horario.available ? Colors.white : Color.fromRGBO(255, 255, 255, 0.6),
              borderRadius: BorderRadius.circular(5)),
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Center(
              child: Text(
            horario.time,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(0, 3, 51, 1)),
          )),
        ),
      ),
    );
  }
}
