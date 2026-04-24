import 'dart:async';

import 'package:color_randomizer/core/extensions/color_extensions.dart';
import 'package:color_randomizer/domain/entities/color_model.dart';
import 'package:color_randomizer/presentation/providers/color_provider.dart';
import 'package:color_randomizer/presentation/widgets/animated_copy.dart';
import 'package:color_randomizer/presentation/widgets/animated_like.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryListItem extends ConsumerStatefulWidget {
  final ColorModel colorItem;
  const HistoryListItem({required this.colorItem, super.key});

  @override
  ConsumerState<HistoryListItem> createState() => _HistoryListItemState();
}

class _HistoryListItemState extends ConsumerState<HistoryListItem> {
  final CopyController _copyController = CopyController();

  @override
  void dispose() {
    _copyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.colorItem.color;

    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black12),
        ),
      ),
      title: Text(color.toHex()),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedCopy(
            controller: _copyController,
            onPressed: _handleCopy,
          ),
          AnimatedLike(
            onPressed: _handleLike,
            isActive: widget.colorItem.isFavourite,
            activeBackgroundAlpha: 0,
          ),
        ],
      ),
    );
  }

  Future<void> _handleCopy() async {
    if (_copyController.isCopied) return;

    final hex = widget.colorItem.color.toHex();
    await Clipboard.setData(ClipboardData(text: hex));

    _copyController.triggerCopy();
  }

  Future<void> _handleLike() async {
    await ref
        .read(colorProvider.notifier)
        .updateColor(
          id: widget.colorItem.id,
          isFavourite: !widget.colorItem.isFavourite,
        );
  }
}
