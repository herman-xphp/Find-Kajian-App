import 'package:freezed_annotation/freezed_annotation.dart';
part 'masjid_get_kajian_state.freezed.dart';

@unfreezed
class MasjidGetKajianState with _$MasjidGetKajianState {
  factory MasjidGetKajianState({
    @Default([]) List kajianData,
    @Default({}) Map<String, dynamic> masjidData,
    @Default(true) bool isLoading,
  }) = _MasjidGetKajianState;
}
