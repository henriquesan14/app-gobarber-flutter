import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AgendamentoTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4)
      ),
      child: ListTile(
        title: Text("Henrique Santos",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15
        ),),
        subtitle: Text("em 3 horas"),
        trailing: Icon(FontAwesomeIcons.calendarTimes, color: Colors.red),
        contentPadding: EdgeInsets.all(15),
        leading: Container(
          width: 55,
          height: 55,
          margin: EdgeInsets.only(right: 15),
            child: CircleAvatar(
            backgroundImage: NetworkImage("https://i.ytimg.com/vi/nX2mWiJUW30/maxresdefault.jpg"),
          ),
        ),
      ),
    );
  }
}