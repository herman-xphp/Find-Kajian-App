import 'package:freezed_annotation/freezed_annotation.dart';
part 'detail_kajian_state.freezed.dart';

@unfreezed
class DetailKajianState with _$DetailKajianState {
  factory DetailKajianState({
    @Default({}) Map<String, dynamic> kajianData,
    @Default([]) List reviews,
    @Default({}) Map<String, dynamic> userData,
    String? content,
    String? error,
    @Default(true) bool isLoading,
  }) = _DetailKajianState;
}
