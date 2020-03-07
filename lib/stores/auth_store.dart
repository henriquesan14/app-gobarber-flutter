import 'package:app_gobarber/models/auth_status.dart';
import 'package:app_gobarber/models/response_sign_in.dart';
import 'package:app_gobarber/utils/shared_utils.dart';
import 'package:mobx/mobx.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  @observable
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  @observable
  User user = User();
  @observable
  bool loading = false;

  @action
  getStatus() async {
    bool isLogged = await SharedUtils().check();
    if(isLogged){
        authStatus = AuthStatus.LOGGED;
        return;
    }
    authStatus = AuthStatus.NOT_LOGGED_IN;
  }

  @action
  getUser() async {
    loading = true;
    try{
      ResponseSignIn responseSignIn = await SharedUtils().getAuth();
      user = responseSignIn.user;
    }catch(e){
      print(e);
    }finally{
      loading = false;
    }
  }

}