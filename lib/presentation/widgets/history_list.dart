import 'package:color_randomizer/presentation/providers/color_provider.dart';
import 'package:color_randomizer/presentation/widgets/history_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryList extends ConsumerWidget {
  final bool isFavoritesOnly;
  const HistoryList({
    required this.isFavoritesOnly,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(
      filteredColorsProvider(isFavoritesOnly: isFavoritesOnly),
    );

    if (colors.isEmpty) {
      return Center(
        child: Text(isFavoritesOnly ? 'No favorites yet!' : 'History is empty'),
      );
    }

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        return HistoryListItem(colorItem: colors[index]);
      },
    );
  }
}
