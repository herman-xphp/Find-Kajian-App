import 'dart:ui';

import 'package:find_kajian/service/auth_service/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/register_state.dart';
import 'package:find_kajian/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class RegisterController extends Cubit<RegisterState> implements IBlocBase {
  RegisterController() : super(RegisterState());

  @override
  void initState() {
    //initState event
  }

  @override
  void dispose() {
    //dispose event
  }

  @override
  void ready() {
    //ready event
  }

  void register({
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) async {
    try {
      bool success = await AuthService().register(
        name: state.name!,
        email: state.email!,
        phone: state.phone!,
        password: state.password!,
        confirm_password: state.confirm_password!,
      );

      if (success) {
        onSuccess();
      } else {
        onFailure();
      }
    } catch (e) {
      print("Registration error: $e");
    }
  }
}
