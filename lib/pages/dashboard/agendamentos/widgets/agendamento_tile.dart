import 'package:app_gobarber/models/appointment.dart';
import 'package:app_gobarber/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AgendamentoTile extends StatelessWidget {
  final Appointment appointment;

  AgendamentoTile({this.appointment});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: appointment.past ? Color.fromRGBO(255, 255, 255, 0.6) : Colors.white,
        borderRadius: BorderRadius.circular(4)
      ),
      child: ListTile(
        title: Text(appointment.provider.name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15
        ),),
        subtitle: Text(DateUtils.dataExtenso(appointment.date)),
        trailing: appointment.cancelable ? Icon(FontAwesomeIcons.calendarTimes, color: Colors.red) : null,
        contentPadding: EdgeInsets.all(15),
        leading: Container(
          width: 55,
          height: 55,
          margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
            backgroundImage: NetworkImage(
              appointment.provider.avatar != null ? appointment.provider.avatar.url : "https://i.ytimg.com/vi/nX2mWiJUW30/maxresdefault.jpg"
            ),
          ),
        ),
      ),
    );
  }
}