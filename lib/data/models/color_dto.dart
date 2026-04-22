import 'package:color_randomizer/domain/entities/color_model.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'color_dto.g.dart';

@JsonSerializable()
class ColorDto {
  final String id;
  final int color;
  final bool isFavourite;
  final DateTime createdAt;

  const ColorDto({
    required this.id,
    required this.color,
    required this.isFavourite,
    required this.createdAt,
  });

  factory ColorDto.fromEntity(ColorModel entity) => ColorDto(
    id: entity.id,
    color: entity.color.toARGB32(),
    isFavourite: entity.isFavourite,
    createdAt: entity.createdAt,
  );

  factory ColorDto.fromJson(Map<String, dynamic> json) =>
      _$ColorDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ColorDtoToJson(this);

  ColorModel toEntity() {
    return ColorModel(
      id: id,
      color: Color(color),
      isFavourite: isFavourite,
      createdAt: createdAt,
    );
  }
}
