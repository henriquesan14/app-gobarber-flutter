import 'package:app_gobarber/pages/dashboard/prestadores/widgets/card_prestador.dart';
import 'package:flutter/material.dart';

class PrestadorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selecione um prestador"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      backgroundColor: Color(0xffab59c1),
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
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            CardPrestador(),
            CardPrestador(),
            CardPrestador(),
            CardPrestador(),
            CardPrestador(),
          ],
        )
      )
    );
  }
}