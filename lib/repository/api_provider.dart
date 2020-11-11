import 'dart:convert';

import 'package:beautysquare/model/employee_responds.dart';
import 'package:beautysquare/util/logger_util.dart';
import 'package:beautysquare/util/resource_string.dart';
import 'package:dio/dio.dart';
import 'package:beautysquare/model/login_responds.dart';
import 'package:beautysquare/util/logging_interceptor.dart';

import 'app_repository.dart';
import 'dio_error_util.dart';


class ApiProvider implements AppRepository {

  Dio _dio;

  var client;

  ApiProvider() {
    BaseOptions options =
        BaseOptions(receiveTimeout: 10000, connectTimeout: 10000);
    _dio = Dio(options);
    _dio.interceptors.add(LoggingInterceptor());

  }

  @override
  Future<LoginResponds> loginChecking(FormData datas) async {
    try {
      Response response = await _dio.post(ResourceString().getString("base_url_login") + "/auth/login", data: datas);

     /* options: Options(headers: {
        "Authorization": token,
        "Accept": "application/json"
        "Content-Type": "application/json"
        "Content-Type": "application/x-www-form-urlencoded"
        "Content-Type": "multipart/form-data"
      }));*/


      final statusCode = response.statusCode;
      final Map responseBody = json.decode(response.data);
      final LoginResponds _datas = new LoginResponds.fromJson(responseBody);

      LoggerUtil().d("LoginResponds", _datas.message);

      return _datas;

    } catch (error, stacktrace) {
      LoggerUtil().e("logincall stackTrace:", error);
      print("Exception occured: $error stackTrace: $stacktrace");
      return LoginResponds.withError(DioErrorUtil.handleError(error));
    }
  }

  @override
  Future<List<Data>> getNewsList() async {
    try {

      Response response = await _dio.get(ResourceString().getString("base_url_list"));
     //   if (response.statusCode != 200) return null;
     // final Map responseBody = json.decode(response.data);

      final EmployeeResponds _datas =  EmpFromJson(response.toString());

      LoggerUtil().d("NewResponds", _datas.status);

     return _datas.data;

    } catch (error, stacktrace) {
      LoggerUtil().e("NewResponds stackTrace:", error);
      print("Exception occured: ${DioErrorUtil.handleError(error)} ");
      throw Exception(DioErrorUtil.handleError(error));
    }
  }

  @override
  Future<Data> getNewses() {
    // TODO: implement getNewses
    throw UnimplementedError();
  }


}
