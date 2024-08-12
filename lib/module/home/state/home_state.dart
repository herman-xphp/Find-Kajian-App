import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.freezed.dart';

@unfreezed
class HomeState with _$HomeState {
  factory HomeState({
    @Default(0) int currentIndex,
    @Default(null) String? address,
    @Default(null) String? token,
    @Default([]) List products,
    @Default(true) bool isLoading,
  }) = _HomeState;
}
