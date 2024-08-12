import 'package:freezed_annotation/freezed_annotation.dart';
part 'kajian_terdekat_state.freezed.dart';

@unfreezed
class KajianTerdekatState with _$KajianTerdekatState {
  factory KajianTerdekatState({
    @Default(0) int counter,
    @Default([]) List products,
    @Default(null) String? fullAddress,
    @Default(true) bool isLoading,
  }) = _KajianTerdekatState;
}
