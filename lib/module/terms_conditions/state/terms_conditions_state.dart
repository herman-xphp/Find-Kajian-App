import 'package:freezed_annotation/freezed_annotation.dart';
part 'terms_conditions_state.freezed.dart';

@unfreezed
class TermsConditionsState with _$TermsConditionsState {
  factory TermsConditionsState({
    @Default(0) int counter,
  }) = _TermsConditionsState;
}
