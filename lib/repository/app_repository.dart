import 'dart:async';

import 'package:beautysquare/model/employee_responds.dart';
import 'package:dio/dio.dart';
import 'package:beautysquare/model/login_responds.dart';




abstract class AppRepository {


  Future<LoginResponds> loginChecking(FormData data);
  Future<List<Data>> getNewsList();

}
