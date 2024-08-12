import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/privacy_policy_state.dart';
import 'package:find_kajian/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class PrivacyPolicyController extends Cubit<PrivacyPolicyState>
    implements IBlocBase {
  PrivacyPolicyController() : super(PrivacyPolicyState());

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
