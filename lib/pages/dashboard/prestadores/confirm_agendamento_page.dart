import 'package:app_gobarber/widgets/container_gradient.dart';
import 'package:app_gobarber/widgets/submit_button.dart';
import 'package:flutter/material.dart';

class ConfirmAgendamentoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContainerGradient(
      appBar: AppBar(
        title: Text("Confirmar agendamento"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      child: Container(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 160,
              height: 160,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://i.ytimg.com/vi/nX2mWiJUW30/maxresdefault.jpg"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              child: Text(
                "Henrique Santos",
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
                "hoje às 13:00",
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
                onPressed: (){},
                color: Color(0xff3b9eff),
                text: "Confirmar Agendamento",
              ),
            )
          ],
        ),
      ),
    );
  }
}