import 'dart:developer';

import 'package:beautysquare/base/base_page.dart';
import 'package:beautysquare/util/constant.dart';
import 'package:beautysquare/util/screen_text_util.dart';
import 'package:beautysquare/util/shared_Preference_manager.dart';
import 'package:beautysquare/view/news/news_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:beautysquare/util/logger_util.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../block/login/login_bloc.dart';

class LoginForm extends BasePage {

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends BasePageState<LoginForm> {

  LoginBloc _loginBloc;

  var ctrl_txt_mobile = TextEditingController();
  var ctrl_txt_password = TextEditingController();

  bool _autoValidate = false;
  final focuspassword = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  Future<void> initState()  {
    super.initState();

    _loginBloc = BlocProvider.of<LoginBloc>(context);
    ctrl_txt_mobile.addListener(_onPhoneChanged);
    ctrl_txt_password.addListener(_onPasswordChanged);

  }

  @override
  Widget build(BuildContext context) {
    /*return BlocListener<LoginBloc, LoginState>(
    listener: (context, state) {
    if (state.success) {
    _autoValidate = false;
    ctrl_txt_mobile.clear();
    ctrl_txt_password.clear();
    _loginBloc.add(FormReset());
    Navigator.push(context,MaterialPageRoute(builder: (context) => PassesPages()));
    }
    },
    child:*/
   return BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {

          if (state.isSuccess) {

            ctrl_txt_mobile.clear();
            ctrl_txt_password.clear();
            _loginBloc.add(FormReset());

            hideLoadingDialoge();

            SharedPreferenceManager().setLogin(true);

            Future.delayed(Duration.zero, () { _gotoNextPage();});
          }
          else if (state.noNetwork) {
           // showToast("No network");
            LoggerUtil().e("Logincall : ","No Network");
          }
          else if (state.isSubmitting) {
           showLoadingDialoge();
          }
          else if (state.isFailure) {
           // showToast("Some Problem Occured");
            hideLoadingDialoge();
          }
          return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new TextFormField(
                controller: ctrl_txt_mobile,
                decoration: new InputDecoration(
                  labelText: 'Mobile Number',
                  labelStyle: new TextStyle(color: Colors.black),
                  counterText: "",
                ),

                keyboardType: TextInputType.number,
                maxLength: 10,
                maxLines: 1,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (v) {
                  FocusScope.of(context).requestFocus(focuspassword);
                },
                autovalidate: _autoValidate,
                validator: (value) {
                  return _loginBloc.state.isEmailValid
                      ? null
                      : 'Invalid mobile number';
                },
                onChanged: (String text) {
                  setState(() {
                    print("mobile : " + text);
                  });
                },),

              new TextFormField(
                focusNode: focuspassword,
                controller: ctrl_txt_password,
                decoration: new InputDecoration(
                  labelText: 'Password',
                  labelStyle: new TextStyle(color: Colors.black,),),

                keyboardType: TextInputType.text,
                obscureText: true,
                // password format
                maxLines: 1,
                textInputAction: TextInputAction.done,
                autovalidate: _autoValidate,
                validator: (value) {
                  return _loginBloc.state.isPasswordValid
                      ? null
                      : 'Invalid Password';
                },
                onChanged: (String text) {
                  setState(() {
                    print("password : " + text);
                  });
                },),

              new SizedBox(height: 25.0,),

              SizedBox(
                width: double.infinity,
                height: ScreenSizeTextUtil().loginButtonHight,
                child: new RaisedButton(
                  child: Text("LOGIN", textAlign: TextAlign.center,),
                  onPressed: () => LoginAction(),
                  color: Colors.black,
                  elevation: 2.0,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                  splashColor: Colors.black12,
                ),
              ),

            ],
          ),
        ),
      ),
    );
        },
    );
  }

  void _gotoNextPage() async{
    /** get back data from another page**/
    final result = await Navigator.push(context,MaterialPageRoute(builder: (context) => NewsPage()));
  }

  @override
  void dispose() {
    ctrl_txt_mobile.dispose();
    ctrl_txt_password.dispose();
    super.dispose();
  }

  void _onPhoneChanged() {
    _loginBloc.add(MobileChanged(email:  ctrl_txt_mobile.text));
  }
  void _onPasswordChanged() {
    _loginBloc.add(PasswordChanged(password:  ctrl_txt_password.text));
  }


  LoginAction() {
    if (_formKey.currentState.validate()) {
      _loginBloc.add(FormSubmitted(
        username: ctrl_txt_mobile.text,
        password: ctrl_txt_password.text,
      ));
      _formKey.currentState.save();
   }else{
      setState(() {
        _autoValidate = true;
      });
      print("Invalid datas");
    }
  }

}


