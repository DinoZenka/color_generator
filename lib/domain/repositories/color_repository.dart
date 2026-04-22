import 'package:color_randomizer/domain/entities/color_model.dart';

abstract interface class ColorRepository {
  Future<List<ColorModel>> getColorsHistory();
  Future<ColorModel> updateColor(String id, {required bool isFavourite});
  Future<ColorModel> generateColor();
  Future<void> clearAll();
}
