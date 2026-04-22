import 'package:color_randomizer/presentation/providers/color_provider.dart';
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

    final textColor = bgColor.computeLuminance() > 0.5
        ? Colors.black
        : Colors.white;

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
                LastGenerated(
                  displayColors: recentColors,
                  textColor: textColor,
                ),
              ],
              if (ref.watch(colorProvider).isLoading && totalGenerated == 0)
                const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
