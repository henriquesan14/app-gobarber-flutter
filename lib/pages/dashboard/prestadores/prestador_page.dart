import 'package:app_gobarber/pages/dashboard/prestadores/widgets/card_prestador.dart';
import 'package:app_gobarber/stores/agendamentos_store.dart';
import 'package:app_gobarber/widgets/container_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PrestadorPage extends StatelessWidget {
  final AgendamentosStore agendamentosStore = AgendamentosStore();
  @override
  Widget build(BuildContext context) {
    agendamentosStore.getProviders();
    return ContainerGradient(
        appBar: AppBar(
          title: Text("Selecione um prestador"),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
        ),
        child: Observer(
            builder: (_){
              return agendamentosStore.providers.length > 0 ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2
                ),
                itemCount: agendamentosStore.providers.length,
                itemBuilder: (context, index){
                  return CardPrestador(
                    name: agendamentosStore.providers[index].name,
                    avatar: agendamentosStore.providers[index].avatar != null ?
                    agendamentosStore.providers[index].avatar.url : null,
                  );
                },
              ) :
              Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              );
            }
        ));
  }
}
