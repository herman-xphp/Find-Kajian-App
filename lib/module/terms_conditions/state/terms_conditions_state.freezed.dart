// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'terms_conditions_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TermsConditionsState {
  int get counter => throw _privateConstructorUsedError;
  set counter(int value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TermsConditionsStateCopyWith<TermsConditionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TermsConditionsStateCopyWith<$Res> {
  factory $TermsConditionsStateCopyWith(TermsConditionsState value,
          $Res Function(TermsConditionsState) then) =
      _$TermsConditionsStateCopyWithImpl<$Res, TermsConditionsState>;
  @useResult
  $Res call({int counter});
}

/// @nodoc
class _$TermsConditionsStateCopyWithImpl<$Res,
        $Val extends TermsConditionsState>
    implements $TermsConditionsStateCopyWith<$Res> {
  _$TermsConditionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
  }) {
    return _then(_value.copyWith(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TermsConditionsStateImplCopyWith<$Res>
    implements $TermsConditionsStateCopyWith<$Res> {
  factory _$$TermsConditionsStateImplCopyWith(_$TermsConditionsStateImpl value,
          $Res Function(_$TermsConditionsStateImpl) then) =
      __$$TermsConditionsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int counter});
}

/// @nodoc
class __$$TermsConditionsStateImplCopyWithImpl<$Res>
    extends _$TermsConditionsStateCopyWithImpl<$Res, _$TermsConditionsStateImpl>
    implements _$$TermsConditionsStateImplCopyWith<$Res> {
  __$$TermsConditionsStateImplCopyWithImpl(_$TermsConditionsStateImpl _value,
      $Res Function(_$TermsConditionsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
  }) {
    return _then(_$TermsConditionsStateImpl(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TermsConditionsStateImpl implements _TermsConditionsState {
  _$TermsConditionsStateImpl({this.counter = 0});

  @override
  @JsonKey()
  int counter;

  @override
  String toString() {
    return 'TermsConditionsState(counter: $counter)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TermsConditionsStateImplCopyWith<_$TermsConditionsStateImpl>
      get copyWith =>
          __$$TermsConditionsStateImplCopyWithImpl<_$TermsConditionsStateImpl>(
              this, _$identity);
}

abstract class _TermsConditionsState implements TermsConditionsState {
  factory _TermsConditionsState({int counter}) = _$TermsConditionsStateImpl;

  @override
  int get counter;
  set counter(int value);
  @override
  @JsonKey(ignore: true)
  _$$TermsConditionsStateImplCopyWith<_$TermsConditionsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
