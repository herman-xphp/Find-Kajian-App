// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UpdateProfileState {
  bool get isLoading => throw _privateConstructorUsedError;
  set isLoading(bool value) => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  set error(String? value) => throw _privateConstructorUsedError;
  Map<String, dynamic> get userData => throw _privateConstructorUsedError;
  set userData(Map<String, dynamic> value) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateProfileStateCopyWith<UpdateProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateProfileStateCopyWith<$Res> {
  factory $UpdateProfileStateCopyWith(
          UpdateProfileState value, $Res Function(UpdateProfileState) then) =
      _$UpdateProfileStateCopyWithImpl<$Res, UpdateProfileState>;
  @useResult
  $Res call({bool isLoading, String? error, Map<String, dynamic> userData});
}

/// @nodoc
class _$UpdateProfileStateCopyWithImpl<$Res, $Val extends UpdateProfileState>
    implements $UpdateProfileStateCopyWith<$Res> {
  _$UpdateProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? userData = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      userData: null == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateProfileStateImplCopyWith<$Res>
    implements $UpdateProfileStateCopyWith<$Res> {
  factory _$$UpdateProfileStateImplCopyWith(_$UpdateProfileStateImpl value,
          $Res Function(_$UpdateProfileStateImpl) then) =
      __$$UpdateProfileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? error, Map<String, dynamic> userData});
}

/// @nodoc
class __$$UpdateProfileStateImplCopyWithImpl<$Res>
    extends _$UpdateProfileStateCopyWithImpl<$Res, _$UpdateProfileStateImpl>
    implements _$$UpdateProfileStateImplCopyWith<$Res> {
  __$$UpdateProfileStateImplCopyWithImpl(_$UpdateProfileStateImpl _value,
      $Res Function(_$UpdateProfileStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? userData = null,
  }) {
    return _then(_$UpdateProfileStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      userData: null == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$UpdateProfileStateImpl implements _UpdateProfileState {
  _$UpdateProfileStateImpl(
      {this.isLoading = true, this.error, this.userData = const {}});

  @override
  @JsonKey()
  bool isLoading;
  @override
  String? error;
  @override
  @JsonKey()
  Map<String, dynamic> userData;

  @override
  String toString() {
    return 'UpdateProfileState(isLoading: $isLoading, error: $error, userData: $userData)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProfileStateImplCopyWith<_$UpdateProfileStateImpl> get copyWith =>
      __$$UpdateProfileStateImplCopyWithImpl<_$UpdateProfileStateImpl>(
          this, _$identity);
}

abstract class _UpdateProfileState implements UpdateProfileState {
  factory _UpdateProfileState(
      {bool isLoading,
      String? error,
      Map<String, dynamic> userData}) = _$UpdateProfileStateImpl;

  @override
  bool get isLoading;
  set isLoading(bool value);
  @override
  String? get error;
  set error(String? value);
  @override
  Map<String, dynamic> get userData;
  set userData(Map<String, dynamic> value);
  @override
  @JsonKey(ignore: true)
  _$$UpdateProfileStateImplCopyWith<_$UpdateProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
