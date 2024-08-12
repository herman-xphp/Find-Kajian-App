import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/forget_password_state.dart';
import 'package:find_kajian/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class ForgetPasswordController extends Cubit<ForgetPasswordState>
    implements IBlocBase {
  ForgetPasswordController() : super(ForgetPasswordState());

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

  increment() {
    state.counter++;
    emit(state.copyWith());
  }
}
