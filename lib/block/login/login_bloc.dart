import 'dart:async';
import 'dart:convert';
import 'package:beautysquare/model/login_responds.dart';
import 'package:beautysquare/repository/app_repository.dart';
import 'package:beautysquare/util/data_injector.dart';
import 'package:beautysquare/util/device_info.dart';
import 'package:beautysquare/util/network_checking.dart';
import 'package:beautysquare/util/validators.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  AppRepository _repository;
  Map<String, String> _deviceData = <String, String>{};
  FormData formData;

  LoginBloc() {
    _repository = new Injector().myRepository;
  }

  @override
  LoginState get initialState => LoginState.initial();

  @override
  void onTransition(Transition<LoginEvent, LoginState> transition) {
    print(transition);
  }

  @override
  Stream<LoginState> mapEventToState(
      LoginEvent event,
  ) async* {
    if (event is MobileChanged) {
      yield state.dataWith(
        email: event.email,
        isEmailValid: Validator.isValidMobile(event.email),
      );
    }
    if (event is PasswordChanged) {
      yield state.dataWith(
        password: event.password,
        isPasswordValid: _isPasswordValid(event.password),
      );
    }
    if (event is FormSubmitted) {
      print('initPlatformState: API CALL');
      yield* _loadData(event.username, event.password);
      // another function go time use yield* then that function stop time continue remain
    }

    if (event is FormReset) {
      yield LoginState.initial();
    }

  }



  Stream<LoginState> _loadData(String mobile,String password) async* {

    if(await NetworkChecking.NetworkAvailable()) {

      yield LoginState.loading();

      try {
      var device_id = "";
      var device_name = "";
      var platform = "";

      _deviceData = await DeviceInfo.initPlatformState();

      device_id = _deviceData['device_id'];
      device_name = _deviceData['device_name'];
      platform = _deviceData['platform'];

      print('initPlatformState: $device_name');

      Map data = {
        'phone': "9446317290",
        'password': "dyenal",
        'device_id': device_id,
        'device_info': device_name,
        'device_type': platform,
        'push_token': "token",
        'user_type': "Public"
      };
      //encode Map to JSON
      var body = json.encode(data);
      print("initPlatformState - $body");

      formData = new FormData.fromMap({
        'phone': "9446317290",
        'password': "dyenal",
        "device_id": device_id,
        "device_info": device_name,
        "device_type": platform,
        "push_token": "token",
        "user_type": "Public",
      });

      LoginResponds responds = await _repository.loginChecking(formData);
      if (responds != null)
        yield LoginState.success();
      else
        yield LoginState.failure();

      } catch (_) {
        yield LoginState.failure();
      }
    }else{
      yield LoginState.noNetwork();
       print("no internet");
    }
  }



  bool _isPasswordValid(String password) {
    if(password.trim().length > 0)
      return true;
    else
      return false;
  }


}
