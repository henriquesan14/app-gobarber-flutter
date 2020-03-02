import 'package:mobx/mobx.dart';
part 'horario_store.g.dart';

class HorarioStore = _HorarioStoreBase with _$HorarioStore;

abstract class _HorarioStoreBase with Store {
  var months = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"];

  @observable
  DateTime dataSelecionada = DateTime.now();

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
  
  
}