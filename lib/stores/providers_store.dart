import 'package:app_gobarber/api/http_request.dart';
import 'package:app_gobarber/models/provider.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
part 'providers_store.g.dart';

class ProvidersStore = _ProvidersStoreBase with _$ProvidersStore;

abstract class _ProvidersStoreBase with Store {
  @observable
  List<Provider> providers = List<Provider>();

  @action
  getProviders() async {
    Dio dio = await HttpRequest().getApi();
      Response response = await dio.get('/providers');
      var list = response.data as List;
      providers = list.map((i) => Provider.fromJson(i)).toList();
  }
  
}