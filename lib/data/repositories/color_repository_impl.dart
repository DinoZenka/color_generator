import 'package:color_randomizer/data/datasources/color_local_data_source.dart';

import 'package:color_randomizer/domain/entities/color_model.dart';
import 'package:color_randomizer/domain/repositories/color_repository.dart';
import 'package:color_randomizer/domain/repositories/random_number.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ColorRepositoryImpl implements ColorRepository {
  final RandomNumber _randomService;
  final ColorLocalDataSource _localDataSource;
  final uuid = const Uuid();

  ColorRepositoryImpl(this._randomService, this._localDataSource);

  @override
  Future<List<ColorModel>> getColorsHistory() async {
    return _localDataSource.getAllColors();
  }

  @override
  Future<ColorModel> updateColor(String id, {required bool isFavourite}) async {
    return _localDataSource.updateColor(id, isFavourite: isFavourite);
  }

  @override
  Future<ColorModel> generateColor() async {
    final r = _randomService.getRandomInt(256);
    final g = _randomService.getRandomInt(256);
    final b = _randomService.getRandomInt(256);

    final color = int.parse('0xFF${_toHex(r)}${_toHex(g)}${_toHex(b)}');

    final newColor = ColorModel(
      id: uuid.v1(),
      color: Color(color),
      isFavourite: false,
      createdAt: DateTime.now(),
    );

    await _localDataSource.saveNewColor(newColor);

    return newColor;
  }

  @override
  Future<void> clearAll() {
    return _localDataSource.clearAll();
  }

  String _toHex(int value) =>
      value.toRadixString(16).padLeft(2, '0').toUpperCase();
}
