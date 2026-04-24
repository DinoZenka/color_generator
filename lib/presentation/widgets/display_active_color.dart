import 'dart:async';

import 'package:color_randomizer/core/extensions/color_extensions.dart';
import 'package:color_randomizer/presentation/providers/color_provider.dart';
import 'package:color_randomizer/presentation/widgets/animated_copy.dart';
import 'package:color_randomizer/presentation/widgets/animated_like.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DisplayActiveColor extends ConsumerStatefulWidget {
  final String colorId;
  final Color color;
  final bool isFavourite;
  const DisplayActiveColor({
    required this.color,
    required this.colorId,
    required this.isFavourite,
    super.key,
  });

  @override
  ConsumerState<DisplayActiveColor> createState() => _DisplayActiveColorState();
}

class _DisplayActiveColorState extends ConsumerState<DisplayActiveColor> {
  final CopyController _copyController = CopyController();

  @override
  void dispose() {
    _copyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final foregroundColor = widget.color.contrastColor;

    return Card(
      elevation: 0,
      color: foregroundColor.withAlpha(25),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: _handleCopy,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.color.toHex(),
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: foregroundColor,
                ),
              ),
              AnimatedCopy(
                controller: _copyController,
                onPressed: null,
                color: foregroundColor,
              ),

              AnimatedLike(
                onPressed: _handleLikePress,
                isActive: widget.isFavourite,
                color: foregroundColor,
                iconColor: foregroundColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleCopy() async {
    if (_copyController.isCopied) return;

    final hex = widget.color.toHex();
    await Clipboard.setData(ClipboardData(text: hex));

    _copyController.triggerCopy();
  }

  Future<void> _handleLikePress() async {
    await ref
        .read(colorProvider.notifier)
        .updateColor(
          id: widget.colorId,
          isFavourite: !widget.isFavourite,
        );
  }
}
