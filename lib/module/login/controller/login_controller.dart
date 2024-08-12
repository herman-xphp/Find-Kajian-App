import 'package:find_kajian/shared/util/db_service/db_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:find_kajian/bloc_util.dart';
import 'package:find_kajian/module/login/state/login_state.dart';
import 'package:find_kajian/service/auth_service/auth_service.dart';

import 'package:find_kajian/shared/util/show_loading/show_loading.dart';
import 'package:injectable/injectable.dart';

@singleton
class LoginController extends Cubit<LoginState> implements IBlocBase {
  LoginController() : super(LoginState());

  @override
  void initState() {
    //initState event
    state.email = DBService.get('email');
  }

  @override
  void dispose() {
    //dispose event
  }

  @override
  void ready() {
    //ready event
  }

  void login({
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) async {
    try {
      showLoading();

      bool isLoggedIn = await AuthService()
          .login(email: state.email!, password: state.password!);
      hideLoading();

      if (isLoggedIn) {
        onSuccess();
      } else {
        onFailure();
      }
    } catch (e) {
      hideLoading();
      // Log atau tangani error sesuai kebutuhan
      print('Error during login: $e');
      onFailure();
    }
  }
}
