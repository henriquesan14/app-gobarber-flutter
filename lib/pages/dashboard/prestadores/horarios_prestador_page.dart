import 'package:app_gobarber/pages/dashboard/prestadores/widgets/horario_tile.dart';
import 'package:app_gobarber/stores/horario_store.dart';
import 'package:app_gobarber/widgets/container_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HorariosPrestadorPage extends StatelessWidget{

  final HorarioStore horarioStore = HorarioStore();

  pickDate(context){
    DatePicker.showDatePicker(
      context,
      locale: LocaleType.pt,
      currentTime: horarioStore.dataSelecionada,
      minTime: DateTime.now(),
      onConfirm: (value){
        horarioStore.setDataSelecionada(value);
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
          Row(
            children: <Widget>[
              HorarioTile(
                text: "08:00",
                available: true,
              ),
              SizedBox(width: 10,),
              HorarioTile(
                text: "09:00",
                available: false,
              )
            ],
          ),
          Row(
            children: <Widget>[ 
              HorarioTile(
                text: "10:00",
                available: false,
              ),
              SizedBox(width: 10,),
              HorarioTile(
                text: "11:00",
                available: true,
              )
            ],
          ),
          Row(
            children: <Widget>[ 
              HorarioTile(
                text: "12:00",
                available: false,
              ),
              SizedBox(width: 10,),
              HorarioTile(
                text: "13:00",
                available: true,
              )
            ],
          ),
          Row(
            children: <Widget>[ 
              HorarioTile(
                text: "14:00",
                available: false,
              ),
              SizedBox(width: 10,),
              HorarioTile(
                text: "15:00",
                available: true,
              )
            ],
          ),
          Row(
            children: <Widget>[ 
              HorarioTile(
                text: "16:00",
                available: true,
              ),
              SizedBox(width: 10,),
              HorarioTile(
                text: "17:00",
                available: false,
              )
            ],
          ),
          Row(
            children: <Widget>[ 
              HorarioTile(
                text: "18:00",
                available: true,
              ),
              SizedBox(width: 10,),
              HorarioTile(
                text: "19:00",
                available: true,
              )
            ],
          ),
          Row(
            children: <Widget>[ 
              HorarioTile(
                text: "20:00",
                available: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}