// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'masjid_terdekat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MasjidTerdekatState {
  List<dynamic> get products => throw _privateConstructorUsedError;
  set products(List<dynamic> value) => throw _privateConstructorUsedError;
  String? get fullAddress => throw _privateConstructorUsedError;
  set fullAddress(String? value) => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  set isLoading(bool value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MasjidTerdekatStateCopyWith<MasjidTerdekatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MasjidTerdekatStateCopyWith<$Res> {
  factory $MasjidTerdekatStateCopyWith(
          MasjidTerdekatState value, $Res Function(MasjidTerdekatState) then) =
      _$MasjidTerdekatStateCopyWithImpl<$Res, MasjidTerdekatState>;
  @useResult
  $Res call({List<dynamic> products, String? fullAddress, bool isLoading});
}

/// @nodoc
class _$MasjidTerdekatStateCopyWithImpl<$Res, $Val extends MasjidTerdekatState>
    implements $MasjidTerdekatStateCopyWith<$Res> {
  _$MasjidTerdekatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? fullAddress = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      fullAddress: freezed == fullAddress
          ? _value.fullAddress
          : fullAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MasjidTerdekatStateImplCopyWith<$Res>
    implements $MasjidTerdekatStateCopyWith<$Res> {
  factory _$$MasjidTerdekatStateImplCopyWith(_$MasjidTerdekatStateImpl value,
          $Res Function(_$MasjidTerdekatStateImpl) then) =
      __$$MasjidTerdekatStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic> products, String? fullAddress, bool isLoading});
}

/// @nodoc
class __$$MasjidTerdekatStateImplCopyWithImpl<$Res>
    extends _$MasjidTerdekatStateCopyWithImpl<$Res, _$MasjidTerdekatStateImpl>
    implements _$$MasjidTerdekatStateImplCopyWith<$Res> {
  __$$MasjidTerdekatStateImplCopyWithImpl(_$MasjidTerdekatStateImpl _value,
      $Res Function(_$MasjidTerdekatStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? fullAddress = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$MasjidTerdekatStateImpl(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      fullAddress: freezed == fullAddress
          ? _value.fullAddress
          : fullAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MasjidTerdekatStateImpl implements _MasjidTerdekatState {
  _$MasjidTerdekatStateImpl(
      {this.products = const [],
      this.fullAddress = null,
      this.isLoading = true});

  @override
  @JsonKey()
  List<dynamic> products;
  @override
  @JsonKey()
  String? fullAddress;
  @override
  @JsonKey()
  bool isLoading;

  @override
  String toString() {
    return 'MasjidTerdekatState(products: $products, fullAddress: $fullAddress, isLoading: $isLoading)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MasjidTerdekatStateImplCopyWith<_$MasjidTerdekatStateImpl> get copyWith =>
      __$$MasjidTerdekatStateImplCopyWithImpl<_$MasjidTerdekatStateImpl>(
          this, _$identity);
}

abstract class _MasjidTerdekatState implements MasjidTerdekatState {
  factory _MasjidTerdekatState(
      {List<dynamic> products,
      String? fullAddress,
      bool isLoading}) = _$MasjidTerdekatStateImpl;

  @override
  List<dynamic> get products;
  set products(List<dynamic> value);
  @override
  String? get fullAddress;
  set fullAddress(String? value);
  @override
  bool get isLoading;
  set isLoading(bool value);
  @override
  @JsonKey(ignore: true)
  _$$MasjidTerdekatStateImplCopyWith<_$MasjidTerdekatStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
