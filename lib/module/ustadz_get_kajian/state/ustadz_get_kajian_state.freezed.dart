// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ustadz_get_kajian_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UstadzGetKajianState {
  List<dynamic> get kajianData => throw _privateConstructorUsedError;
  set kajianData(List<dynamic> value) => throw _privateConstructorUsedError;
  Map<String, dynamic> get ustadzData => throw _privateConstructorUsedError;
  set ustadzData(Map<String, dynamic> value) =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  set isLoading(bool value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UstadzGetKajianStateCopyWith<UstadzGetKajianState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UstadzGetKajianStateCopyWith<$Res> {
  factory $UstadzGetKajianStateCopyWith(UstadzGetKajianState value,
          $Res Function(UstadzGetKajianState) then) =
      _$UstadzGetKajianStateCopyWithImpl<$Res, UstadzGetKajianState>;
  @useResult
  $Res call(
      {List<dynamic> kajianData,
      Map<String, dynamic> ustadzData,
      bool isLoading});
}

/// @nodoc
class _$UstadzGetKajianStateCopyWithImpl<$Res,
        $Val extends UstadzGetKajianState>
    implements $UstadzGetKajianStateCopyWith<$Res> {
  _$UstadzGetKajianStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kajianData = null,
    Object? ustadzData = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      kajianData: null == kajianData
          ? _value.kajianData
          : kajianData // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      ustadzData: null == ustadzData
          ? _value.ustadzData
          : ustadzData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UstadzGetKajianStateImplCopyWith<$Res>
    implements $UstadzGetKajianStateCopyWith<$Res> {
  factory _$$UstadzGetKajianStateImplCopyWith(_$UstadzGetKajianStateImpl value,
          $Res Function(_$UstadzGetKajianStateImpl) then) =
      __$$UstadzGetKajianStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<dynamic> kajianData,
      Map<String, dynamic> ustadzData,
      bool isLoading});
}

/// @nodoc
class __$$UstadzGetKajianStateImplCopyWithImpl<$Res>
    extends _$UstadzGetKajianStateCopyWithImpl<$Res, _$UstadzGetKajianStateImpl>
    implements _$$UstadzGetKajianStateImplCopyWith<$Res> {
  __$$UstadzGetKajianStateImplCopyWithImpl(_$UstadzGetKajianStateImpl _value,
      $Res Function(_$UstadzGetKajianStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kajianData = null,
    Object? ustadzData = null,
    Object? isLoading = null,
  }) {
    return _then(_$UstadzGetKajianStateImpl(
      kajianData: null == kajianData
          ? _value.kajianData
          : kajianData // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      ustadzData: null == ustadzData
          ? _value.ustadzData
          : ustadzData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UstadzGetKajianStateImpl implements _UstadzGetKajianState {
  _$UstadzGetKajianStateImpl(
      {this.kajianData = const [],
      this.ustadzData = const {},
      this.isLoading = true});

  @override
  @JsonKey()
  List<dynamic> kajianData;
  @override
  @JsonKey()
  Map<String, dynamic> ustadzData;
  @override
  @JsonKey()
  bool isLoading;

  @override
  String toString() {
    return 'UstadzGetKajianState(kajianData: $kajianData, ustadzData: $ustadzData, isLoading: $isLoading)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UstadzGetKajianStateImplCopyWith<_$UstadzGetKajianStateImpl>
      get copyWith =>
          __$$UstadzGetKajianStateImplCopyWithImpl<_$UstadzGetKajianStateImpl>(
              this, _$identity);
}

abstract class _UstadzGetKajianState implements UstadzGetKajianState {
  factory _UstadzGetKajianState(
      {List<dynamic> kajianData,
      Map<String, dynamic> ustadzData,
      bool isLoading}) = _$UstadzGetKajianStateImpl;

  @override
  List<dynamic> get kajianData;
  set kajianData(List<dynamic> value);
  @override
  Map<String, dynamic> get ustadzData;
  set ustadzData(Map<String, dynamic> value);
  @override
  bool get isLoading;
  set isLoading(bool value);
  @override
  @JsonKey(ignore: true)
  _$$UstadzGetKajianStateImplCopyWith<_$UstadzGetKajianStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
