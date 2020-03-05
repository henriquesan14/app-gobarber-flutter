import 'package:app_gobarber/pages/dashboard/prestadores/widgets/horario_tile.dart';
import 'package:app_gobarber/stores/horario_store.dart';
import 'package:app_gobarber/widgets/container_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HorariosPrestadorPage extends StatelessWidget{
  final HorarioStore horarioStore = HorarioStore();
  final int idPrestador;

  HorariosPrestadorPage(this.idPrestador);

  pickDate(context){
    DatePicker.showDatePicker(
      context,
      locale: LocaleType.pt,
      currentTime: horarioStore.dataSelecionada,
      minTime: horarioStore.dataSelecionada,
      onConfirm: (value){
        horarioStore.setDataSelecionada(value);
        horarioStore.getHorarios(idPrestador);
      },
      theme: DatePickerTheme(
        titleHeight: 30,
        itemHeight: 80,
        cancelStyle: TextStyle(
          fontSize: 18,
          
        ),
        doneStyle: TextStyle(
          fontSize: 18,
          
        ),
        itemStyle: TextStyle(
          fontSize: 30,
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    horarioStore.getHorarios(idPrestador);
    return ContainerGradient(
      appBar: AppBar(
        title: Text("Selecione um horário"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      child: ListView(
        children: <Widget>[
          GestureDetector(
              onTap: (){
                pickDate(context);
              },
                child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.calendarAlt,
                      color: Colors.white,
                      size: 25,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Observer(
                          builder: (_){
                            return Text(
                              horarioStore.dataFormada,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18
                              ),
                            );
                        }
                      ),
                    )
                  ],
                ),
            ),
          ),
          Observer(
            builder: (_){
              return !horarioStore.loading ? Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      HorarioTile(horarioStore.horarios[0]),
                      SizedBox(width: 10),
                      HorarioTile(horarioStore.horarios[1]),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      HorarioTile(horarioStore.horarios[2]),
                      SizedBox(width: 10),
                      HorarioTile(horarioStore.horarios[3]),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      HorarioTile(horarioStore.horarios[4]),
                      SizedBox(width: 10),
                      HorarioTile(horarioStore.horarios[5]),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      HorarioTile(horarioStore.horarios[6]),
                      SizedBox(width: 10),
                      HorarioTile(horarioStore.horarios[7]),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      HorarioTile(horarioStore.horarios[8]),
                      SizedBox(width: 10),
                      HorarioTile(horarioStore.horarios[9]),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      HorarioTile(horarioStore.horarios[10]),
                    ],
                  )
                ],
              ) :
              Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}