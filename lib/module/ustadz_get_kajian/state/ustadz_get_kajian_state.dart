import 'package:freezed_annotation/freezed_annotation.dart';
part 'ustadz_get_kajian_state.freezed.dart';

@unfreezed
class UstadzGetKajianState with _$UstadzGetKajianState {
  factory UstadzGetKajianState({
    @Default([]) List kajianData,
    @Default({}) Map<String, dynamic> ustadzData,
    @Default(true) bool isLoading,
  }) = _UstadzGetKajianState;
}
