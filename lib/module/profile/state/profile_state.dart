import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_state.freezed.dart';

@unfreezed
class ProfileState with _$ProfileState {
  factory ProfileState({
    @Default('1.0') String version,
    @Default(true) bool isLoading,
    @Default(null) String? error,
    @Default({}) Map<String, dynamic> userData,
  }) = _ProfileState;
}
