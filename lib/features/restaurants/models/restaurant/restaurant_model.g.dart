// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RestaurantModel _$$_RestaurantModelFromJson(Map<String, dynamic> json) =>
    _$_RestaurantModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      isFavourite: json['is_favourite'] as bool,
      userId: json['user_id'] as int,
      coordsId: json['coords_id'] as int,
      scheduleId: json['schedule_id'] as int,
      images: (json['images'] as List<dynamic>)
          .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      coords: CoordsModel.fromJson(json['coords'] as Map<String, dynamic>),
      schedule:
          ScheduleModel.fromJson(json['schedule'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RestaurantModelToJson(_$_RestaurantModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'is_favourite': instance.isFavourite,
      'user_id': instance.userId,
      'coords_id': instance.coordsId,
      'schedule_id': instance.scheduleId,
      'images': instance.images,
      'user': instance.user,
      'coords': instance.coords,
      'schedule': instance.schedule,
    };
