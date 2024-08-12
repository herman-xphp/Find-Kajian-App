import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_profile_state.freezed.dart';

@unfreezed
class UpdateProfileState with _$UpdateProfileState {
  factory UpdateProfileState({
    @Default(true) bool isLoading,
    String? error,
    @Default({}) Map<String, dynamic> userData,
  }) = _UpdateProfileState;
}
