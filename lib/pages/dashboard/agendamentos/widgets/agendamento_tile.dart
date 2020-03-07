import 'package:app_gobarber/stores/agendamentos_store.dart';
import 'package:app_gobarber/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AgendamentoTile extends StatelessWidget {
  final int index;
  final AgendamentosStore agendamentosStore;

  AgendamentoTile(this.index, this.agendamentosStore);

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_){
        return Container(
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: agendamentosStore.agendamentos[index].past ? Color.fromRGBO(255, 255, 255, 0.6) : Colors.white,
          borderRadius: BorderRadius.circular(4)
        ),
        child: ListTile(
          title: Text(agendamentosStore.agendamentos[index].provider.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15
          ),),
          subtitle: Text(DateUtils.dataExtenso(agendamentosStore.agendamentos[index].date)),
          trailing: agendamentosStore.agendamentos[index].cancelable ?
          IconButton(
            icon: Icon(FontAwesomeIcons.calendarTimes, color: Colors.red),
            onPressed: (){
              agendamentosStore.cancelAgendamento(context, agendamentosStore.agendamentos[index]);
            },
          ) :
          null,
          contentPadding: EdgeInsets.all(15),
          leading: Container(
            width: 55,
            height: 55,
            margin: EdgeInsets.only(right: 10),
              child: CircleAvatar(
              backgroundImage: NetworkImage(
                agendamentosStore.agendamentos[index].provider.avatar != null ? agendamentosStore.agendamentos[index].provider.avatar.url : "https://i.ytimg.com/vi/nX2mWiJUW30/maxresdefault.jpg"
              ),
            ),
          ),
        ),
      );
        },
    );
  }
}