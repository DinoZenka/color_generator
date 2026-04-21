import 'package:color_randomizer/presentation/providers/color_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final colors = ref.watch(colorProvider).value;
    final hasItems = colors != null && colors.isNotEmpty;
    final bgColor = hasItems ? colors.first.color : theme.colorScheme.surface;

    return Scaffold(
      body: InkWell(
        onTap: () {
          ref.read(colorProvider.notifier).generateColor();
        },
        child: Container(
          color: bgColor,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              Text('Hello there', style: theme.textTheme.titleLarge),
              if (hasItems)
                Text(
                  'Total generated: ${colors.length}',
                  style: theme.textTheme.bodyLarge,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
