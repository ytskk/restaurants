// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coords_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CoordsModel _$$_CoordsModelFromJson(Map<String, dynamic> json) =>
    _$_CoordsModel(
      id: json['id'] as int,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      addressName: json['address_name'] as String,
    );

Map<String, dynamic> _$$_CoordsModelToJson(_$_CoordsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address_name': instance.addressName,
    };
