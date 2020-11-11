
import 'package:beautysquare/util/resource_string.dart';
import 'package:beautysquare/util/screen_text_util.dart';

import 'package:beautysquare/base/base_page.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../block/login/login_bloc.dart';
import 'login_form.dart';


class LoginPagesBlock extends BasePage {

  static const routeName = '/login';

  @override
  _LoginPagesBlockState createState() => new _LoginPagesBlockState();
}

class _LoginPagesBlockState extends BasePageState<LoginPagesBlock>{

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar:  AppBar(
        title: Text(
        ResourceString().getString("title"),
        textAlign: TextAlign.left,
        style: ScreenSizeTextUtil().getTextStyleRegular(
            color: Colors.white, fontsize: 16, fontWeight: FontWeight.bold),
      ),
        automaticallyImplyLeading: false,
        elevation: defaultTargetPlatform == TargetPlatform.iOS ? 0.0 : 5.0,
      ),
      body: BlocProvider(
        create: (context) => LoginBloc(),
        child: LoginForm(),
    ),
    );
  }
}

