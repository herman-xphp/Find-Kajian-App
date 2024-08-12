import 'package:freezed_annotation/freezed_annotation.dart';
part 'daftar_ustadz_state.freezed.dart';

@unfreezed
class DaftarUstadzState with _$DaftarUstadzState {
  factory DaftarUstadzState({
    // @Default([]) List<Ustadz> ustadzResults,
    @Default([]) List ustadzResults,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _DaftarUstadzState;
}
