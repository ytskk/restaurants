import 'package:freezed_annotation/freezed_annotation.dart';

part 'coords_model.freezed.dart';
part 'coords_model.g.dart';

@freezed
class CoordsModel with _$CoordsModel {
  const factory CoordsModel({
    required int id,
    required double latitude,
    required double longitude,
    @JsonKey(name: 'address_name') required String addressName,
  }) = _CoordsModel;

  factory CoordsModel.fromJson(Map<String, dynamic> json) =>
      _$CoordsModelFromJson(json);
}
