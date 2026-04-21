import 'dart:ui';

import 'package:equatable/equatable.dart';

class ColorModel extends Equatable {
  final String id;
  final Color color;
  final bool isFavourite;
  final DateTime createdAt;

  const ColorModel({
    required this.id,
    required this.color,
    required this.isFavourite,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, color, isFavourite, createdAt];

  ColorModel copyWith({bool? isFavourite}) {
    return ColorModel(
      id: id,
      color: color,
      isFavourite: isFavourite ?? this.isFavourite,
      createdAt: createdAt,
    );
  }
}
