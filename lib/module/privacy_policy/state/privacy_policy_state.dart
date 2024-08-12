import 'package:freezed_annotation/freezed_annotation.dart';
part 'privacy_policy_state.freezed.dart';

@unfreezed
class PrivacyPolicyState with _$PrivacyPolicyState {
  factory PrivacyPolicyState({
    @Default(0) int counter,
  }) = _PrivacyPolicyState;
}
