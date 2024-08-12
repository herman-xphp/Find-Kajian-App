import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/splash_screen_state.dart';
import 'package:find_kajian/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class SplashScreenController extends Cubit<SplashScreenState>
    implements IBlocBase {
  SplashScreenController() : super(SplashScreenState());

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
}
