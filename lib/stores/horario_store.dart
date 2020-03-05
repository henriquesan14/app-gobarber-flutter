import 'package:app_gobarber/api/http_request.dart';
import 'package:app_gobarber/models/horario.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
part 'horario_store.g.dart';

class HorarioStore = _HorarioStoreBase with _$HorarioStore;

abstract class _HorarioStoreBase with Store {
  var months = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"];

  @observable
  DateTime dataSelecionada = DateTime.now();

  @observable
  List<Horario> horarios = List<Horario>();

  @observable
  bool loading = false;

  @computed
  String get dataFormada {
    var dia = dataSelecionada.day;
    var mes = months[dataSelecionada.month -1];
    var ano = dataSelecionada.year;
    return "$dia de $mes de $ano";
  }

  @action
  void setDataSelecionada(value){
    this.dataSelecionada = value;
  }

  @action
  getHorarios(idPrestador) async {
      loading = true;
      try{
        Dio dio = await HttpRequest().getApi();
        Response response = await dio.get('/providers/$idPrestador/available?date=${dataSelecionada.millisecondsSinceEpoch}');
        var list = response.data as List;
        horarios = list.map((i) => Horario.fromJson(i)).toList();
      }on DioError catch(e){
        print(e);
      }finally{
        loading = false;
      }
  }
  
  
}