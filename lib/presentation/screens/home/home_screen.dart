import 'package:color_randomizer/core/extensions/color_extensions.dart';
import 'package:color_randomizer/presentation/providers/color_provider.dart';
import 'package:color_randomizer/presentation/widgets/action_buttons.dart';
import 'package:color_randomizer/presentation/widgets/display_active_color.dart';
import 'package:color_randomizer/presentation/widgets/last_generated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final bgColorModel = ref.watch(displayColorProvider);
    final totalGenerated = ref.watch(
      colorProvider.select((async) => async.value?.length ?? 0),
    );
    final recentColors = ref.watch(recentColorsProvider);

    final textColor = bgColorModel.color.contrastColor;

    return Scaffold(
      backgroundColor: bgColorModel.color,
      persistentFooterButtons: [
        ActionButtons(textColor: textColor, clearDisabled: totalGenerated == 0),
      ],
      body: InkWell(
        onTap: () => ref.read(colorProvider.notifier).generateColor(),
        child: Center(
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
                DisplayActiveColor(
                  color: bgColorModel.color,
                  colorId: bgColorModel.id,
                  isFavourite: bgColorModel.isFavourite,
                ),
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
            ],
          ),
        ),
      ),
    );
  }
}
