import 'package:app_gobarber/models/response_sign_in.dart';
import 'package:app_gobarber/utils/shared_utils.dart';
import 'package:dio/dio.dart';

class HttpRequest {
  final Dio dio = Dio();

  HttpRequest() {
    dio.options.baseUrl = 'https://baber-api.herokuapp.com/';
    dio.options.receiveTimeout = 15000;
    dio.interceptors
      ..add(InterceptorsWrapper(onRequest: (RequestOptions options) {
        print('token');
        options.headers["csrfToken"] = 'csrfToken';
        ResponseSignIn responseSignIn = SharedUtils().getAuth();
        if(responseSignIn != null){
          options.headers = {'Authorization': responseSignIn.token};
        }
        return options;
      }, onResponse: (Response response) {
        print('onResponse------------------');
        return response;
      }, onError: (DioError error) {
        print('---------------->>>>>>>>>>>>>>>>>>error');
        print(error);
        return error;
      }))
      ..add(LogInterceptor());
  }
}