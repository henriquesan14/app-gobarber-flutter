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