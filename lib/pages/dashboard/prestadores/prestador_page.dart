import 'package:app_gobarber/pages/dashboard/prestadores/widgets/card_prestador.dart';
import 'package:app_gobarber/stores/providers_store.dart';
import 'package:app_gobarber/widgets/container_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PrestadorPage extends StatelessWidget {
  final ProvidersStore providersStore = ProvidersStore();
  @override
  Widget build(BuildContext context) {
    providersStore.getProviders();
    return ContainerGradient(
        appBar: AppBar(
          title: Text("Selecione um prestador"),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
        ),
        child: Observer(
            builder: (_){
              return providersStore.providers.length > 0 ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2
                ),
                itemCount: providersStore.providers.length,
                itemBuilder: (context, index){
                  return CardPrestador(providersStore.providers[index]);
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
