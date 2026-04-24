import 'package:color_randomizer/data/providers.dart';
import 'package:color_randomizer/domain/entities/color_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'color_provider.g.dart';

final defaultBgColor = ColorModel(
  id: '#FFFFFF',
  color: Colors.white,
  isFavourite: false,
  createdAt: DateTime.now(),
);

@riverpod
class ColorNotifier extends _$ColorNotifier {
  @override
  FutureOr<List<ColorModel>> build() async {
    final repo = ref.read(colorRepositoryProvider);
    final colors = await repo.getColorsHistory();
    return colors;
  }

  Future<void> updateColor({
    required String id,
    required bool isFavourite,
  }) async {
    final repo = ref.read(colorRepositoryProvider);
    final updatedColor = await repo.updateColor(id, isFavourite: isFavourite);

    final previousState = await future;
    state = AsyncData(
      previousState
          .map((color) => color.id == id ? updatedColor : color)
          .toList(),
    );
  }

  Future<void> generateColor() async {
    final repo = ref.read(colorRepositoryProvider);
    final newColor = await repo.generateColor();

    final previousState = await future;
    state = AsyncData([newColor, ...previousState]);
  }

  Future<void> clearAll() async {
    final repo = ref.read(colorRepositoryProvider);
    await repo.clearAll();

    state = const AsyncData([]);
  }
}

@riverpod
class ActiveColor extends _$ActiveColor {
  @override
  ColorModel? build() {
    ref.listen(colorProvider.select((async) => async.value), (
      prev,
      next,
    ) {
      if (prev?.length != next?.length || state == null) {
        state = null;
        return;
      }
      final updatedColor = next?.firstWhere((col) => col.id == state?.id);
      if (updatedColor != null && state != null) {
        state = updatedColor;
      }
    });

    return null;
  }

  // ignore: use_setters_to_change_properties
  void setActiveColor(ColorModel color) => state = color;
}

@riverpod
ColorModel displayColor(Ref ref) {
  final selection = ref.watch(activeColorProvider);
  if (selection != null) return selection;

  final latestColor = ref.watch(
    colorProvider.select((async) => async.value?.firstOrNull),
  );

  return latestColor ?? defaultBgColor;
}

@riverpod
List<ColorModel> recentColors(Ref ref) {
  return ref.watch(
    colorProvider.select((async) => async.value?.take(5).toList() ?? []),
  );
}

@riverpod
List<ColorModel> filteredColors(Ref ref, {bool isFavoritesOnly = false}) {
  final allColors = ref.watch(colorProvider).value ?? [];
  return isFavoritesOnly
      ? allColors.where((c) => c.isFavourite).toList()
      : allColors;
}
