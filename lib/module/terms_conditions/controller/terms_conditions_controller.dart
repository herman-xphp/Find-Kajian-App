import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/terms_conditions_state.dart';
import 'package:find_kajian/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class TermsConditionsController extends Cubit<TermsConditionsState>
    implements IBlocBase {
  TermsConditionsController() : super(TermsConditionsState());

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
