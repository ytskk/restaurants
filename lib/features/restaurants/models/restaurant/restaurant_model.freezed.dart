// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'restaurant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RestaurantModel _$RestaurantModelFromJson(Map<String, dynamic> json) {
  return _RestaurantModel.fromJson(json);
}

/// @nodoc
mixin _$RestaurantModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_favourite')
  bool get isFavourite => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'coords_id')
  int get coordsId => throw _privateConstructorUsedError;
  @JsonKey(name: 'schedule_id')
  int get scheduleId => throw _privateConstructorUsedError;
  List<ImageModel> get images => throw _privateConstructorUsedError;
  UserModel get user => throw _privateConstructorUsedError;
  CoordsModel get coords => throw _privateConstructorUsedError;
  ScheduleModel get schedule => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestaurantModelCopyWith<RestaurantModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantModelCopyWith<$Res> {
  factory $RestaurantModelCopyWith(
          RestaurantModel value, $Res Function(RestaurantModel) then) =
      _$RestaurantModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String title,
      String description,
      @JsonKey(name: 'is_favourite') bool isFavourite,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'coords_id') int coordsId,
      @JsonKey(name: 'schedule_id') int scheduleId,
      List<ImageModel> images,
      UserModel user,
      CoordsModel coords,
      ScheduleModel schedule});

  $UserModelCopyWith<$Res> get user;
  $CoordsModelCopyWith<$Res> get coords;
  $ScheduleModelCopyWith<$Res> get schedule;
}

/// @nodoc
class _$RestaurantModelCopyWithImpl<$Res>
    implements $RestaurantModelCopyWith<$Res> {
  _$RestaurantModelCopyWithImpl(this._value, this._then);

  final RestaurantModel _value;
  // ignore: unused_field
  final $Res Function(RestaurantModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? isFavourite = freezed,
    Object? userId = freezed,
    Object? coordsId = freezed,
    Object? scheduleId = freezed,
    Object? images = freezed,
    Object? user = freezed,
    Object? coords = freezed,
    Object? schedule = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isFavourite: isFavourite == freezed
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      coordsId: coordsId == freezed
          ? _value.coordsId
          : coordsId // ignore: cast_nullable_to_non_nullable
              as int,
      scheduleId: scheduleId == freezed
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as int,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      coords: coords == freezed
          ? _value.coords
          : coords // ignore: cast_nullable_to_non_nullable
              as CoordsModel,
      schedule: schedule == freezed
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as ScheduleModel,
    ));
  }

  @override
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  @override
  $CoordsModelCopyWith<$Res> get coords {
    return $CoordsModelCopyWith<$Res>(_value.coords, (value) {
      return _then(_value.copyWith(coords: value));
    });
  }

  @override
  $ScheduleModelCopyWith<$Res> get schedule {
    return $ScheduleModelCopyWith<$Res>(_value.schedule, (value) {
      return _then(_value.copyWith(schedule: value));
    });
  }
}

/// @nodoc
abstract class _$$_RestaurantModelCopyWith<$Res>
    implements $RestaurantModelCopyWith<$Res> {
  factory _$$_RestaurantModelCopyWith(
          _$_RestaurantModel value, $Res Function(_$_RestaurantModel) then) =
      __$$_RestaurantModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String title,
      String description,
      @JsonKey(name: 'is_favourite') bool isFavourite,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'coords_id') int coordsId,
      @JsonKey(name: 'schedule_id') int scheduleId,
      List<ImageModel> images,
      UserModel user,
      CoordsModel coords,
      ScheduleModel schedule});

  @override
  $UserModelCopyWith<$Res> get user;
  @override
  $CoordsModelCopyWith<$Res> get coords;
  @override
  $ScheduleModelCopyWith<$Res> get schedule;
}

/// @nodoc
class __$$_RestaurantModelCopyWithImpl<$Res>
    extends _$RestaurantModelCopyWithImpl<$Res>
    implements _$$_RestaurantModelCopyWith<$Res> {
  __$$_RestaurantModelCopyWithImpl(
      _$_RestaurantModel _value, $Res Function(_$_RestaurantModel) _then)
      : super(_value, (v) => _then(v as _$_RestaurantModel));

  @override
  _$_RestaurantModel get _value => super._value as _$_RestaurantModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? isFavourite = freezed,
    Object? userId = freezed,
    Object? coordsId = freezed,
    Object? scheduleId = freezed,
    Object? images = freezed,
    Object? user = freezed,
    Object? coords = freezed,
    Object? schedule = freezed,
  }) {
    return _then(_$_RestaurantModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isFavourite: isFavourite == freezed
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      coordsId: coordsId == freezed
          ? _value.coordsId
          : coordsId // ignore: cast_nullable_to_non_nullable
              as int,
      scheduleId: scheduleId == freezed
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as int,
      images: images == freezed
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      coords: coords == freezed
          ? _value.coords
          : coords // ignore: cast_nullable_to_non_nullable
              as CoordsModel,
      schedule: schedule == freezed
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as ScheduleModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RestaurantModel implements _RestaurantModel {
  const _$_RestaurantModel(
      {required this.id,
      required this.title,
      required this.description,
      @JsonKey(name: 'is_favourite') required this.isFavourite,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'coords_id') required this.coordsId,
      @JsonKey(name: 'schedule_id') required this.scheduleId,
      required final List<ImageModel> images,
      required this.user,
      required this.coords,
      required this.schedule})
      : _images = images;

  factory _$_RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$$_RestaurantModelFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  @override
  @JsonKey(name: 'is_favourite')
  final bool isFavourite;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'coords_id')
  final int coordsId;
  @override
  @JsonKey(name: 'schedule_id')
  final int scheduleId;
  final List<ImageModel> _images;
  @override
  List<ImageModel> get images {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final UserModel user;
  @override
  final CoordsModel coords;
  @override
  final ScheduleModel schedule;

  @override
  String toString() {
    return 'RestaurantModel(id: $id, title: $title, description: $description, isFavourite: $isFavourite, userId: $userId, coordsId: $coordsId, scheduleId: $scheduleId, images: $images, user: $user, coords: $coords, schedule: $schedule)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RestaurantModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.isFavourite, isFavourite) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.coordsId, coordsId) &&
            const DeepCollectionEquality()
                .equals(other.scheduleId, scheduleId) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.coords, coords) &&
            const DeepCollectionEquality().equals(other.schedule, schedule));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(isFavourite),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(coordsId),
      const DeepCollectionEquality().hash(scheduleId),
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(coords),
      const DeepCollectionEquality().hash(schedule));

  @JsonKey(ignore: true)
  @override
  _$$_RestaurantModelCopyWith<_$_RestaurantModel> get copyWith =>
      __$$_RestaurantModelCopyWithImpl<_$_RestaurantModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RestaurantModelToJson(
      this,
    );
  }
}

abstract class _RestaurantModel implements RestaurantModel {
  const factory _RestaurantModel(
      {required final int id,
      required final String title,
      required final String description,
      @JsonKey(name: 'is_favourite') required final bool isFavourite,
      @JsonKey(name: 'user_id') required final int userId,
      @JsonKey(name: 'coords_id') required final int coordsId,
      @JsonKey(name: 'schedule_id') required final int scheduleId,
      required final List<ImageModel> images,
      required final UserModel user,
      required final CoordsModel coords,
      required final ScheduleModel schedule}) = _$_RestaurantModel;

  factory _RestaurantModel.fromJson(Map<String, dynamic> json) =
      _$_RestaurantModel.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get description;
  @override
  @JsonKey(name: 'is_favourite')
  bool get isFavourite;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'coords_id')
  int get coordsId;
  @override
  @JsonKey(name: 'schedule_id')
  int get scheduleId;
  @override
  List<ImageModel> get images;
  @override
  UserModel get user;
  @override
  CoordsModel get coords;
  @override
  ScheduleModel get schedule;
  @override
  @JsonKey(ignore: true)
  _$$_RestaurantModelCopyWith<_$_RestaurantModel> get copyWith =>
      throw _privateConstructorUsedError;
}
