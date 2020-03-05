import 'package:app_gobarber/models/response_sign_in.dart';
import 'package:app_gobarber/utils/shared_utils.dart';
import 'package:dio/dio.dart';

class HttpRequest {

  Future<Dio> getApi() async{
    Dio dio = Dio();
    ResponseSignIn responseSignIn;
    bool isLogged =  await SharedUtils().check();
    if(isLogged){
     responseSignIn = await SharedUtils().getAuth();
    }
    
    dio.interceptors.clear();
    dio.options.baseUrl = 'https://baber-api.herokuapp.com/';
    dio.options.receiveTimeout = 15000;
    dio.interceptors
      ..add(InterceptorsWrapper(onRequest: (RequestOptions options) {
        
        if(responseSignIn != null){
          options.headers["Authorization"] = "Bearer " +responseSignIn.token;
        }
        return options;
      }, onResponse: (Response response) {
        return response;
      }, onError: (DioError error) {
        return error;
      }))
      ..add(LogInterceptor());
    return dio;
  }
}