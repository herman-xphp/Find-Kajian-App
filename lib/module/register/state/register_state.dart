import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_state.freezed.dart';

@unfreezed
class RegisterState with _$RegisterState {
  factory RegisterState({
    @Default(null) String? name,
    @Default(null) String? email,
    @Default(null) String? phone,
    @Default(null) String? password,
    @Default(null) String? confirm_password,
    @Default(true) bool isLoading,
  }) = _RegisterState;
}
