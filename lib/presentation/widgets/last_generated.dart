import 'package:color_randomizer/domain/entities/color_model.dart';
import 'package:color_randomizer/presentation/providers/color_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LastGenerated extends ConsumerWidget {
  final List<ColorModel> displayColors;
  final Color? textColor;
  const LastGenerated({super.key, required this.displayColors, this.textColor});

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
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 4,
              ),
            ],
          ),
          child: Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: displayColors
                .map<Widget>(
                  (ColorModel currentColor) => InkWell(
                    key: ValueKey(currentColor.id),
                    onTap: () => ref
                        .read(activeColorProvider.notifier)
                        .select(currentColor.color),
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
      ],
    );
  }
}
