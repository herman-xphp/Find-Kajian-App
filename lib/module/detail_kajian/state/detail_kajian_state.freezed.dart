// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_kajian_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DetailKajianState {
  Map<String, dynamic> get kajianData => throw _privateConstructorUsedError;
  set kajianData(Map<String, dynamic> value) =>
      throw _privateConstructorUsedError;
  List<dynamic> get reviews => throw _privateConstructorUsedError;
  set reviews(List<dynamic> value) => throw _privateConstructorUsedError;
  Map<String, dynamic> get userData => throw _privateConstructorUsedError;
  set userData(Map<String, dynamic> value) =>
      throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  set content(String? value) => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  set error(String? value) => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  set isLoading(bool value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailKajianStateCopyWith<DetailKajianState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailKajianStateCopyWith<$Res> {
  factory $DetailKajianStateCopyWith(
          DetailKajianState value, $Res Function(DetailKajianState) then) =
      _$DetailKajianStateCopyWithImpl<$Res, DetailKajianState>;
  @useResult
  $Res call(
      {Map<String, dynamic> kajianData,
      List<dynamic> reviews,
      Map<String, dynamic> userData,
      String? content,
      String? error,
      bool isLoading});
}

/// @nodoc
class _$DetailKajianStateCopyWithImpl<$Res, $Val extends DetailKajianState>
    implements $DetailKajianStateCopyWith<$Res> {
  _$DetailKajianStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kajianData = null,
    Object? reviews = null,
    Object? userData = null,
    Object? content = freezed,
    Object? error = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      kajianData: null == kajianData
          ? _value.kajianData
          : kajianData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      reviews: null == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      userData: null == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailKajianStateImplCopyWith<$Res>
    implements $DetailKajianStateCopyWith<$Res> {
  factory _$$DetailKajianStateImplCopyWith(_$DetailKajianStateImpl value,
          $Res Function(_$DetailKajianStateImpl) then) =
      __$$DetailKajianStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, dynamic> kajianData,
      List<dynamic> reviews,
      Map<String, dynamic> userData,
      String? content,
      String? error,
      bool isLoading});
}

/// @nodoc
class __$$DetailKajianStateImplCopyWithImpl<$Res>
    extends _$DetailKajianStateCopyWithImpl<$Res, _$DetailKajianStateImpl>
    implements _$$DetailKajianStateImplCopyWith<$Res> {
  __$$DetailKajianStateImplCopyWithImpl(_$DetailKajianStateImpl _value,
      $Res Function(_$DetailKajianStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kajianData = null,
    Object? reviews = null,
    Object? userData = null,
    Object? content = freezed,
    Object? error = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$DetailKajianStateImpl(
      kajianData: null == kajianData
          ? _value.kajianData
          : kajianData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      reviews: null == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      userData: null == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DetailKajianStateImpl implements _DetailKajianState {
  _$DetailKajianStateImpl(
      {this.kajianData = const {},
      this.reviews = const [],
      this.userData = const {},
      this.content,
      this.error,
      this.isLoading = true});

  @override
  @JsonKey()
  Map<String, dynamic> kajianData;
  @override
  @JsonKey()
  List<dynamic> reviews;
  @override
  @JsonKey()
  Map<String, dynamic> userData;
  @override
  String? content;
  @override
  String? error;
  @override
  @JsonKey()
  bool isLoading;

  @override
  String toString() {
    return 'DetailKajianState(kajianData: $kajianData, reviews: $reviews, userData: $userData, content: $content, error: $error, isLoading: $isLoading)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailKajianStateImplCopyWith<_$DetailKajianStateImpl> get copyWith =>
      __$$DetailKajianStateImplCopyWithImpl<_$DetailKajianStateImpl>(
          this, _$identity);
}

abstract class _DetailKajianState implements DetailKajianState {
  factory _DetailKajianState(
      {Map<String, dynamic> kajianData,
      List<dynamic> reviews,
      Map<String, dynamic> userData,
      String? content,
      String? error,
      bool isLoading}) = _$DetailKajianStateImpl;

  @override
  Map<String, dynamic> get kajianData;
  set kajianData(Map<String, dynamic> value);
  @override
  List<dynamic> get reviews;
  set reviews(List<dynamic> value);
  @override
  Map<String, dynamic> get userData;
  set userData(Map<String, dynamic> value);
  @override
  String? get content;
  set content(String? value);
  @override
  String? get error;
  set error(String? value);
  @override
  bool get isLoading;
  set isLoading(bool value);
  @override
  @JsonKey(ignore: true)
  _$$DetailKajianStateImplCopyWith<_$DetailKajianStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
