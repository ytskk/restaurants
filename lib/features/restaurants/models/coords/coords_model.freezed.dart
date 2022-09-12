// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'coords_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CoordsModel _$CoordsModelFromJson(Map<String, dynamic> json) {
  return _CoordsModel.fromJson(json);
}

/// @nodoc
mixin _$CoordsModel {
  int get id => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_name')
  String get addressName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoordsModelCopyWith<CoordsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoordsModelCopyWith<$Res> {
  factory $CoordsModelCopyWith(
          CoordsModel value, $Res Function(CoordsModel) then) =
      _$CoordsModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      double latitude,
      double longitude,
      @JsonKey(name: 'address_name') String addressName});
}

/// @nodoc
class _$CoordsModelCopyWithImpl<$Res> implements $CoordsModelCopyWith<$Res> {
  _$CoordsModelCopyWithImpl(this._value, this._then);

  final CoordsModel _value;
  // ignore: unused_field
  final $Res Function(CoordsModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? addressName = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      addressName: addressName == freezed
          ? _value.addressName
          : addressName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_CoordsModelCopyWith<$Res>
    implements $CoordsModelCopyWith<$Res> {
  factory _$$_CoordsModelCopyWith(
          _$_CoordsModel value, $Res Function(_$_CoordsModel) then) =
      __$$_CoordsModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      double latitude,
      double longitude,
      @JsonKey(name: 'address_name') String addressName});
}

/// @nodoc
class __$$_CoordsModelCopyWithImpl<$Res> extends _$CoordsModelCopyWithImpl<$Res>
    implements _$$_CoordsModelCopyWith<$Res> {
  __$$_CoordsModelCopyWithImpl(
      _$_CoordsModel _value, $Res Function(_$_CoordsModel) _then)
      : super(_value, (v) => _then(v as _$_CoordsModel));

  @override
  _$_CoordsModel get _value => super._value as _$_CoordsModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? addressName = freezed,
  }) {
    return _then(_$_CoordsModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      addressName: addressName == freezed
          ? _value.addressName
          : addressName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CoordsModel implements _CoordsModel {
  const _$_CoordsModel(
      {required this.id,
      required this.latitude,
      required this.longitude,
      @JsonKey(name: 'address_name') required this.addressName});

  factory _$_CoordsModel.fromJson(Map<String, dynamic> json) =>
      _$$_CoordsModelFromJson(json);

  @override
  final int id;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  @JsonKey(name: 'address_name')
  final String addressName;

  @override
  String toString() {
    return 'CoordsModel(id: $id, latitude: $latitude, longitude: $longitude, addressName: $addressName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CoordsModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.latitude, latitude) &&
            const DeepCollectionEquality().equals(other.longitude, longitude) &&
            const DeepCollectionEquality()
                .equals(other.addressName, addressName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(latitude),
      const DeepCollectionEquality().hash(longitude),
      const DeepCollectionEquality().hash(addressName));

  @JsonKey(ignore: true)
  @override
  _$$_CoordsModelCopyWith<_$_CoordsModel> get copyWith =>
      __$$_CoordsModelCopyWithImpl<_$_CoordsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CoordsModelToJson(
      this,
    );
  }
}

abstract class _CoordsModel implements CoordsModel {
  const factory _CoordsModel(
          {required final int id,
          required final double latitude,
          required final double longitude,
          @JsonKey(name: 'address_name') required final String addressName}) =
      _$_CoordsModel;

  factory _CoordsModel.fromJson(Map<String, dynamic> json) =
      _$_CoordsModel.fromJson;

  @override
  int get id;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(name: 'address_name')
  String get addressName;
  @override
  @JsonKey(ignore: true)
  _$$_CoordsModelCopyWith<_$_CoordsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
