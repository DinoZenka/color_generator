// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColorDto _$ColorDtoFromJson(Map<String, dynamic> json) => ColorDto(
  id: json['id'] as String,
  color: (json['color'] as num).toInt(),
  isFavourite: json['isFavourite'] as bool,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$ColorDtoToJson(ColorDto instance) => <String, dynamic>{
  'id': instance.id,
  'color': instance.color,
  'isFavourite': instance.isFavourite,
  'createdAt': instance.createdAt.toIso8601String(),
};
