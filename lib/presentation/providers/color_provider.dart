import 'package:color_randomizer/data/providers.dart';
import 'package:color_randomizer/domain/entities/color_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'color_provider.g.dart';

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
    final updatedColor = await repo.updateColor(id, isFavourite);

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
}
