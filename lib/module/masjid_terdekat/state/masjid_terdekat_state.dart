import 'package:freezed_annotation/freezed_annotation.dart';
part 'masjid_terdekat_state.freezed.dart';

@unfreezed
class MasjidTerdekatState with _$MasjidTerdekatState {
  factory MasjidTerdekatState({
    @Default([]) List products,
    @Default(null) String? fullAddress,
    @Default(true) bool isLoading,
  }) = _MasjidTerdekatState;
}
