import 'package:color_randomizer/core/extensions/color_extensions.dart';
import 'package:color_randomizer/presentation/providers/color_provider.dart';
import 'package:color_randomizer/presentation/widgets/display_active_color.dart';
import 'package:color_randomizer/presentation/widgets/history_bottom_sheet.dart';
import 'package:color_randomizer/presentation/widgets/last_generated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final bgColor = ref.watch(displayColorProvider);
    final totalGenerated = ref.watch(
      colorProvider.select((async) => async.value?.length ?? 0),
    );
    final recentColors = ref.watch(recentColorsProvider);

    final textColor = bgColor.contrastColor;

    return Scaffold(
      body: InkWell(
        onTap: () => ref.read(colorProvider.notifier).generateColor(),
        child: Container(
          color: bgColor,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello there',
                style: theme.textTheme.titleLarge?.copyWith(color: textColor),
              ),
              if (totalGenerated > 0) ...[
                Text(
                  'Total generated: $totalGenerated',
                  style: theme.textTheme.bodyLarge?.copyWith(color: textColor),
                ),
                const SizedBox(height: 28),
                DisplayActiveColor(color: bgColor),
                const SizedBox(height: 28),
                LastGenerated(
                  displayColors: recentColors,
                  textColor: textColor,
                ),
                const SizedBox(height: 28),
              ] else
                Text(
                  'Tap anywhere to change the color!',
                  style: theme.textTheme.bodyLarge?.copyWith(color: textColor),
                ),
              if (ref.watch(colorProvider).isLoading && totalGenerated == 0)
                const CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: textColor.withAlpha(30),
                      foregroundColor: textColor,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    icon: const Icon(Icons.history),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        useSafeArea: true,
                        showDragHandle: true,
                        backgroundColor: theme.colorScheme.surface,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(24),
                          ),
                        ),
                        builder: (context) => const HistoryBottomSheet(),
                      );
                    },
                    label: const Text("Show history"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
