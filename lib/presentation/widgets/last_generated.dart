import 'package:color_randomizer/domain/entities/color_model.dart';
import 'package:color_randomizer/presentation/providers/color_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LastGenerated extends ConsumerWidget {
  final List<ColorModel> displayColors;
  final Color? textColor;
  const LastGenerated({required this.displayColors, super.key, this.textColor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Column(
      spacing: 8,
      children: [
        Text(
          'Last generated:',
          style: theme.textTheme.labelLarge?.copyWith(color: textColor),
        ),
        Card(
          elevation: 0,
          color: textColor?.withAlpha(25),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: displayColors
                  .map<Widget>(
                    (ColorModel currentColor) => InkWell(
                      borderRadius: BorderRadius.circular(8),
                      key: ValueKey(currentColor.id),
                      onTap: () => ref
                          .read(activeColorProvider.notifier)
                          .setActiveColor(currentColor.color),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.5),
                              blurRadius: 4,
                            ),
                          ],
                          color: currentColor.color,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: 50,
                        height: 50,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
