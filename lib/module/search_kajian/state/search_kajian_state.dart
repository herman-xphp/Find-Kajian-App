import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_kajian_state.freezed.dart';

// @unfreezed
// class SearchKajianState with _$SearchKajianState {
//   factory SearchKajianState({
//     @Default([]) List data,
//     @Default([]) List dataKajian,
//     @Default([]) List dataTempatKajian,
//     @Default(false) bool isLoading,
//     String? errorMessage,
//     @Default(true) bool isKajianSelected,
//     @Default(1) int value,
//   }) = _SearchKajianState;
// }
@unfreezed
class SearchKajianState with _$SearchKajianState {
  factory SearchKajianState({
    @Default([]) List kajianResults,
    @Default([]) List tempatKajianResults,
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default(true) bool isKajianSelected,
  }) = _SearchKajianState;
}
