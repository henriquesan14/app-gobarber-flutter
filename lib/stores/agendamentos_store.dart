import 'package:app_gobarber/api/http_request.dart';
import 'package:app_gobarber/models/provider.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
part 'agendamentos_store.g.dart';

class AgendamentosStore = _AgendamentosStoreBase with _$AgendamentosStore;

abstract class _AgendamentosStoreBase with Store {
  @observable
  List<Provider> providers = List<Provider>();

  @action
  Future getProviders() async {
    Response response = await HttpRequest().dio.get('/providers');
      List<Provider> providerss = List.from(response.data);
      providers = providerss;
  }
  
}