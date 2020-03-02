import 'package:app_gobarber/pages/dashboard/prestadores/widgets/card_prestador.dart';
import 'package:app_gobarber/widgets/container_gradient.dart';
import 'package:flutter/material.dart';

class PrestadorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContainerGradient(
        appBar: AppBar(
          title: Text("Selecione um prestador"),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
        ),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            CardPrestador(),
            CardPrestador(),
            CardPrestador(),
            CardPrestador(),
            CardPrestador(),
          ],
        ));
  }
}
