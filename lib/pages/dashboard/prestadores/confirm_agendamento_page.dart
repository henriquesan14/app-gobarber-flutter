import 'package:app_gobarber/models/provider.dart';
import 'package:app_gobarber/stores/agendamentos_store.dart';
import 'package:app_gobarber/utils/date_utils.dart';
import 'package:app_gobarber/widgets/container_gradient.dart';
import 'package:app_gobarber/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ConfirmAgendamentoPage extends StatelessWidget {
  final AgendamentosStore agendamentosStore = AgendamentosStore();
  final Provider provider;
  final String date;

  ConfirmAgendamentoPage(this.provider, this.date);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirmar agendamento"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      backgroundColor: Color(0xffab59c1),
      body: Observer(
        builder: (_){
          return ModalProgressHUD(
            inAsyncCall: agendamentosStore.loadingPostAgendamento,
            opacity: 0.3,
            progressIndicator: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
            child: Container(
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
              child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 180,
              height: 180,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    provider.avatar != null ? provider.avatar.url : "https://i.ytimg.com/vi/nX2mWiJUW30/maxresdefault.jpg"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              child: Text(
                provider.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 4),
              alignment: Alignment.center,
              child: Text(
                DateUtils.dataExtenso(date),
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(255, 255, 255, .6)
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 24),
              width: double.infinity,
              child: SubmitButton(
                onPressed: (){
                  agendamentosStore.postAgendamento(context, provider.id, date);
                },
                color: Color(0xff3b9eff),
                text: "Confirmar Agendamento",
              ),
            )
          ],
        ),
            )
          );
        },
      )
          
      );
  }
}