import 'package:freezed_annotation/freezed_annotation.dart';
part 'forget_password_state.freezed.dart';

@unfreezed
class ForgetPasswordState with _$ForgetPasswordState {
  factory ForgetPasswordState({
    @Default(0) int counter,
  }) = _ForgetPasswordState;
}
