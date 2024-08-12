// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daftar_ustadz_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DaftarUstadzState {
// @Default([]) List<Ustadz> ustadzResults,
  List<dynamic> get ustadzResults =>
      throw _privateConstructorUsedError; // @Default([]) List<Ustadz> ustadzResults,
  set ustadzResults(List<dynamic> value) => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  set isLoading(bool value) => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  set errorMessage(String? value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DaftarUstadzStateCopyWith<DaftarUstadzState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DaftarUstadzStateCopyWith<$Res> {
  factory $DaftarUstadzStateCopyWith(
          DaftarUstadzState value, $Res Function(DaftarUstadzState) then) =
      _$DaftarUstadzStateCopyWithImpl<$Res, DaftarUstadzState>;
  @useResult
  $Res call(
      {List<dynamic> ustadzResults, bool isLoading, String? errorMessage});
}

/// @nodoc
class _$DaftarUstadzStateCopyWithImpl<$Res, $Val extends DaftarUstadzState>
    implements $DaftarUstadzStateCopyWith<$Res> {
  _$DaftarUstadzStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ustadzResults = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      ustadzResults: null == ustadzResults
          ? _value.ustadzResults
          : ustadzResults // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DaftarUstadzStateImplCopyWith<$Res>
    implements $DaftarUstadzStateCopyWith<$Res> {
  factory _$$DaftarUstadzStateImplCopyWith(_$DaftarUstadzStateImpl value,
          $Res Function(_$DaftarUstadzStateImpl) then) =
      __$$DaftarUstadzStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<dynamic> ustadzResults, bool isLoading, String? errorMessage});
}

/// @nodoc
class __$$DaftarUstadzStateImplCopyWithImpl<$Res>
    extends _$DaftarUstadzStateCopyWithImpl<$Res, _$DaftarUstadzStateImpl>
    implements _$$DaftarUstadzStateImplCopyWith<$Res> {
  __$$DaftarUstadzStateImplCopyWithImpl(_$DaftarUstadzStateImpl _value,
      $Res Function(_$DaftarUstadzStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ustadzResults = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$DaftarUstadzStateImpl(
      ustadzResults: null == ustadzResults
          ? _value.ustadzResults
          : ustadzResults // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DaftarUstadzStateImpl implements _DaftarUstadzState {
  _$DaftarUstadzStateImpl(
      {this.ustadzResults = const [],
      this.isLoading = false,
      this.errorMessage});

// @Default([]) List<Ustadz> ustadzResults,
  @override
  @JsonKey()
  List<dynamic> ustadzResults;
  @override
  @JsonKey()
  bool isLoading;
  @override
  String? errorMessage;

  @override
  String toString() {
    return 'DaftarUstadzState(ustadzResults: $ustadzResults, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DaftarUstadzStateImplCopyWith<_$DaftarUstadzStateImpl> get copyWith =>
      __$$DaftarUstadzStateImplCopyWithImpl<_$DaftarUstadzStateImpl>(
          this, _$identity);
}

abstract class _DaftarUstadzState implements DaftarUstadzState {
  factory _DaftarUstadzState(
      {List<dynamic> ustadzResults,
      bool isLoading,
      String? errorMessage}) = _$DaftarUstadzStateImpl;

  @override // @Default([]) List<Ustadz> ustadzResults,
  List<dynamic> get ustadzResults; // @Default([]) List<Ustadz> ustadzResults,
  set ustadzResults(List<dynamic> value);
  @override
  bool get isLoading;
  set isLoading(bool value);
  @override
  String? get errorMessage;
  set errorMessage(String? value);
  @override
  @JsonKey(ignore: true)
  _$$DaftarUstadzStateImplCopyWith<_$DaftarUstadzStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
