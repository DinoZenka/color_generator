import 'dart:async';

import 'package:color_randomizer/core/extensions/color_extensions.dart';
import 'package:color_randomizer/domain/entities/color_model.dart';
import 'package:color_randomizer/presentation/providers/color_provider.dart';
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
  bool _isCopied = false;
  Timer? _timer;

  Future<void> _handleCopy() async {
    final hex = widget.colorItem.color.toHex();
    await Clipboard.setData(ClipboardData(text: hex));
    await HapticFeedback.lightImpact();

    if (mounted) {
      setState(() => _isCopied = true);
    }

    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() => _isCopied = false);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
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
          IconButton(
            tooltip: 'Copy color HEX',
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _isCopied
                  ? const Icon(
                      Icons.check,
                      key: ValueKey('check'),
                      color: Colors.green,
                    )
                  : const Icon(Icons.copy, key: ValueKey('copy')),
            ),
            onPressed: _isCopied ? null : () => unawaited(_handleCopy()),
          ),
          IconButton(
            tooltip: widget.colorItem.isFavourite
                ? 'Remove from favorites'
                : 'Add to favorites',
            icon: Icon(
              widget.colorItem.isFavourite
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: widget.colorItem.isFavourite ? Colors.red : null,
            ),
            onPressed: () {
              unawaited(
                ref
                    .read(colorProvider.notifier)
                    .updateColor(
                      id: widget.colorItem.id,
                      isFavourite: !widget.colorItem.isFavourite,
                    ),
              );
              unawaited(HapticFeedback.lightImpact());
            },
          ),
        ],
      ),
    );
  }
}
