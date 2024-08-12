// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forget_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ForgetPasswordState {
  int get counter => throw _privateConstructorUsedError;
  set counter(int value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgetPasswordStateCopyWith<ForgetPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgetPasswordStateCopyWith<$Res> {
  factory $ForgetPasswordStateCopyWith(
          ForgetPasswordState value, $Res Function(ForgetPasswordState) then) =
      _$ForgetPasswordStateCopyWithImpl<$Res, ForgetPasswordState>;
  @useResult
  $Res call({int counter});
}

/// @nodoc
class _$ForgetPasswordStateCopyWithImpl<$Res, $Val extends ForgetPasswordState>
    implements $ForgetPasswordStateCopyWith<$Res> {
  _$ForgetPasswordStateCopyWithImpl(this._value, this._then);

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
abstract class _$$ForgetPasswordStateImplCopyWith<$Res>
    implements $ForgetPasswordStateCopyWith<$Res> {
  factory _$$ForgetPasswordStateImplCopyWith(_$ForgetPasswordStateImpl value,
          $Res Function(_$ForgetPasswordStateImpl) then) =
      __$$ForgetPasswordStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int counter});
}

/// @nodoc
class __$$ForgetPasswordStateImplCopyWithImpl<$Res>
    extends _$ForgetPasswordStateCopyWithImpl<$Res, _$ForgetPasswordStateImpl>
    implements _$$ForgetPasswordStateImplCopyWith<$Res> {
  __$$ForgetPasswordStateImplCopyWithImpl(_$ForgetPasswordStateImpl _value,
      $Res Function(_$ForgetPasswordStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
  }) {
    return _then(_$ForgetPasswordStateImpl(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ForgetPasswordStateImpl implements _ForgetPasswordState {
  _$ForgetPasswordStateImpl({this.counter = 0});

  @override
  @JsonKey()
  int counter;

  @override
  String toString() {
    return 'ForgetPasswordState(counter: $counter)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgetPasswordStateImplCopyWith<_$ForgetPasswordStateImpl> get copyWith =>
      __$$ForgetPasswordStateImplCopyWithImpl<_$ForgetPasswordStateImpl>(
          this, _$identity);
}

abstract class _ForgetPasswordState implements ForgetPasswordState {
  factory _ForgetPasswordState({int counter}) = _$ForgetPasswordStateImpl;

  @override
  int get counter;
  set counter(int value);
  @override
  @JsonKey(ignore: true)
  _$$ForgetPasswordStateImplCopyWith<_$ForgetPasswordStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
