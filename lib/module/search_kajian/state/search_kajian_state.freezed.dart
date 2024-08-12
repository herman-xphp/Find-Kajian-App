// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_kajian_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchKajianState {
  List<dynamic> get kajianResults => throw _privateConstructorUsedError;
  set kajianResults(List<dynamic> value) => throw _privateConstructorUsedError;
  List<dynamic> get tempatKajianResults => throw _privateConstructorUsedError;
  set tempatKajianResults(List<dynamic> value) =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  set isLoading(bool value) => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  set errorMessage(String? value) => throw _privateConstructorUsedError;
  bool get isKajianSelected => throw _privateConstructorUsedError;
  set isKajianSelected(bool value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchKajianStateCopyWith<SearchKajianState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchKajianStateCopyWith<$Res> {
  factory $SearchKajianStateCopyWith(
          SearchKajianState value, $Res Function(SearchKajianState) then) =
      _$SearchKajianStateCopyWithImpl<$Res, SearchKajianState>;
  @useResult
  $Res call(
      {List<dynamic> kajianResults,
      List<dynamic> tempatKajianResults,
      bool isLoading,
      String? errorMessage,
      bool isKajianSelected});
}

/// @nodoc
class _$SearchKajianStateCopyWithImpl<$Res, $Val extends SearchKajianState>
    implements $SearchKajianStateCopyWith<$Res> {
  _$SearchKajianStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kajianResults = null,
    Object? tempatKajianResults = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? isKajianSelected = null,
  }) {
    return _then(_value.copyWith(
      kajianResults: null == kajianResults
          ? _value.kajianResults
          : kajianResults // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      tempatKajianResults: null == tempatKajianResults
          ? _value.tempatKajianResults
          : tempatKajianResults // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isKajianSelected: null == isKajianSelected
          ? _value.isKajianSelected
          : isKajianSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchKajianStateImplCopyWith<$Res>
    implements $SearchKajianStateCopyWith<$Res> {
  factory _$$SearchKajianStateImplCopyWith(_$SearchKajianStateImpl value,
          $Res Function(_$SearchKajianStateImpl) then) =
      __$$SearchKajianStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<dynamic> kajianResults,
      List<dynamic> tempatKajianResults,
      bool isLoading,
      String? errorMessage,
      bool isKajianSelected});
}

/// @nodoc
class __$$SearchKajianStateImplCopyWithImpl<$Res>
    extends _$SearchKajianStateCopyWithImpl<$Res, _$SearchKajianStateImpl>
    implements _$$SearchKajianStateImplCopyWith<$Res> {
  __$$SearchKajianStateImplCopyWithImpl(_$SearchKajianStateImpl _value,
      $Res Function(_$SearchKajianStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kajianResults = null,
    Object? tempatKajianResults = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? isKajianSelected = null,
  }) {
    return _then(_$SearchKajianStateImpl(
      kajianResults: null == kajianResults
          ? _value.kajianResults
          : kajianResults // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      tempatKajianResults: null == tempatKajianResults
          ? _value.tempatKajianResults
          : tempatKajianResults // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isKajianSelected: null == isKajianSelected
          ? _value.isKajianSelected
          : isKajianSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SearchKajianStateImpl implements _SearchKajianState {
  _$SearchKajianStateImpl(
      {this.kajianResults = const [],
      this.tempatKajianResults = const [],
      this.isLoading = false,
      this.errorMessage,
      this.isKajianSelected = true});

  @override
  @JsonKey()
  List<dynamic> kajianResults;
  @override
  @JsonKey()
  List<dynamic> tempatKajianResults;
  @override
  @JsonKey()
  bool isLoading;
  @override
  String? errorMessage;
  @override
  @JsonKey()
  bool isKajianSelected;

  @override
  String toString() {
    return 'SearchKajianState(kajianResults: $kajianResults, tempatKajianResults: $tempatKajianResults, isLoading: $isLoading, errorMessage: $errorMessage, isKajianSelected: $isKajianSelected)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchKajianStateImplCopyWith<_$SearchKajianStateImpl> get copyWith =>
      __$$SearchKajianStateImplCopyWithImpl<_$SearchKajianStateImpl>(
          this, _$identity);
}

abstract class _SearchKajianState implements SearchKajianState {
  factory _SearchKajianState(
      {List<dynamic> kajianResults,
      List<dynamic> tempatKajianResults,
      bool isLoading,
      String? errorMessage,
      bool isKajianSelected}) = _$SearchKajianStateImpl;

  @override
  List<dynamic> get kajianResults;
  set kajianResults(List<dynamic> value);
  @override
  List<dynamic> get tempatKajianResults;
  set tempatKajianResults(List<dynamic> value);
  @override
  bool get isLoading;
  set isLoading(bool value);
  @override
  String? get errorMessage;
  set errorMessage(String? value);
  @override
  bool get isKajianSelected;
  set isKajianSelected(bool value);
  @override
  @JsonKey(ignore: true)
  _$$SearchKajianStateImplCopyWith<_$SearchKajianStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
