import 'package:app_gobarber/pages/dashboard/agendamentos/widgets/agendamento_tile.dart';
import 'package:app_gobarber/stores/agendamentos_store.dart';
import 'package:app_gobarber/widgets/container_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class AgendamentosPage extends StatelessWidget {
  final AgendamentosStore agendamentosStore = AgendamentosStore();
  @override
  Widget build(BuildContext context) {
    agendamentosStore.getAgendamentos();
    return ContainerGradient(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: Text("Agendamentos",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      child: Observer(
          builder: (_){
            return agendamentosStore.loadingGetAgendamentos ?
              Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ) :
             LazyLoadScrollView(
                onEndOfPage: (){
                  agendamentosStore.getAgendamentos();
                },
                child: ListView.builder(
                itemBuilder: (context, index){
                  return AgendamentoTile(index, agendamentosStore);
                },
                itemCount: agendamentosStore.agendamentos.length,
            ),
             );
          } 
      ),
    );
  }
}
