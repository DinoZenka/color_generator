import 'dart:convert';

import 'package:color_randomizer/data/models/color_dto.dart';
import 'package:color_randomizer/domain/entities/color_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ColorLocalDataSource {
  Future<List<ColorModel>> getAllColors();
  Future<ColorModel> updateColor(String id, bool isFavourite);
  Future<void> saveNewColor(ColorModel color);
  Future<void> clearAll();
}

class ColorLocalDataSourceImpl implements ColorLocalDataSource {
  final SharedPreferencesAsync _pref;
  ColorLocalDataSourceImpl(this._pref);

  static const String _storageKey = 'colors_history';

  @override
  Future<List<ColorModel>> getAllColors() async {
    final List<String>? colorsJson = await _pref.getStringList(_storageKey);
    if (colorsJson == null) return [];

    return colorsJson.map((jsonString) {
      final Map<String, dynamic> map = jsonDecode(jsonString);
      return ColorDto.fromJson(map).toEntity();
    }).toList();
  }

  @override
  Future<ColorModel> updateColor(String id, bool isFavourite) async {
    final List<ColorModel> currentHistory = await getAllColors();
    final int index = currentHistory.indexWhere((element) => element.id == id);
    if (index == -1) throw Exception("Color not found");

    final updatedColor = currentHistory[index].copyWith(
      isFavourite: isFavourite,
    );
    currentHistory[index] = updatedColor;

    await _saveAll(currentHistory);

    return updatedColor;
  }

  @override
  Future<void> saveNewColor(ColorModel newColor) async {
    final currentHistory = await getAllColors();
    currentHistory.insert(0, newColor);
    await _saveAll(currentHistory);
  }

  @override
  Future<void> clearAll() async {
    return _pref.remove(_storageKey);
  }

  Future<void> _saveAll(List<ColorModel> colors) async {
    final List<String> jsonList = colors.map((color) {
      final dto = ColorDto.fromEntity(color);
      return jsonEncode(dto.toJson());
    }).toList();

    await _pref.setStringList(_storageKey, jsonList);
  }
}
