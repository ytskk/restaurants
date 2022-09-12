import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurants/features/features.dart';
import 'package:restaurants/features/restaurants/models/image/image_model.dart';

part 'restaurant_model.freezed.dart';
part 'restaurant_model.g.dart';

@freezed
class RestaurantModel with _$RestaurantModel {
  const factory RestaurantModel({
    required int id,
    required String title,
    required String description,
    @JsonKey(name: 'is_favourite') required bool isFavourite,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'coords_id') required int coordsId,
    @JsonKey(name: 'schedule_id') required int scheduleId,
    required List<ImageModel> images,
    required UserModel user,
    required CoordsModel coords,
    required ScheduleModel schedule,
  }) = _RestaurantModel;

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);
}
