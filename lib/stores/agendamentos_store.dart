import 'package:app_gobarber/api/http_request.dart';
import 'package:app_gobarber/models/appointment.dart';
import 'package:app_gobarber/pages/dashboard/dashboard.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'agendamentos_store.g.dart';

class AgendamentosStore = _AgendamentosStoreBase with _$AgendamentosStore;

abstract class _AgendamentosStoreBase with Store {

  @observable
  bool loadingPostAgendamento = false;
  @observable
  List<Appointment> agendamentos = List<Appointment>();
  @observable
  bool loadingGetAgendamentos = false;
  @observable
  int page = 1;

  @action
  getAgendamentos() async {
      if(page == 1){
        loadingGetAgendamentos = true;
      }
      try{
        Dio dio = await HttpRequest().getApi();
        Response response = await dio.get('/appointments?page=$page');
        var list = response.data as List;
        if(list.length > 0){
          agendamentos.addAll(
            list.map((i) => Appointment.fromJson(i)).toList()
          );
          page++;
        }
      }catch(e){
        
      }finally{
        loadingGetAgendamentos = false;
      }
  }
  
  @action
  postAgendamento(context, idProvider, date) async {
    loadingPostAgendamento = true;
    try{
      Dio dio = await HttpRequest().getApi();
      Response response = await dio.post('/appointments', data: {
        'provider_id': idProvider,
        'date': date
      });
      if(response.statusCode == 200){
        _showDialog(context, "Sucesso","Agendamento realizado com sucesso!", (){
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => DashBoard()
            ),
            (Route<dynamic> route){
              return false;
            }
          );
        });
      }
    }on DioError catch(e){
      _showDialog(context, "Falha", e.response.data['error'] ?? e.error, (){
        Navigator.pop(context);
      });
    }finally{
      loadingPostAgendamento = false;
    }
  }

  @action
  cancelAgendamento(context, Appointment agendamento) async {
    try{
      Dio dio = await HttpRequest().getApi();
      Response response = await dio.delete('/appointments/${agendamento.id}');
      if(response.statusCode == 200){
        _showDialog(context, "Sucesso","Agendamento cancelado com sucesso!", (){
          agendamentos = List<Appointment>();
          page = 1;
          getAgendamentos();
          Navigator.pop(context);
        });  
      }
    }on DioError catch(e){
      _showDialog(context, "Falha", e.response.data['error'] ?? e.error, (){
        Navigator.pop(context);
      });
    }
  }

  _showDialog(context, title, content, onPress){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: onPress,
              )
            ],
          );
        }
      );
  }
}