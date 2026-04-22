import 'dart:async';

import 'package:color_randomizer/core/extensions/color_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DisplayActiveColor extends StatefulWidget {
  final Color color;
  const DisplayActiveColor({required this.color, super.key});

  @override
  State<DisplayActiveColor> createState() => _DisplayActiveColorState();
}

class _DisplayActiveColorState extends State<DisplayActiveColor> {
  bool _isCopied = false;
  Timer? _timer;

  Future<void> _handleCopy() async {
    final hex = widget.color.toHex();
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
    final theme = Theme.of(context);
    final foregroundColor = widget.color.contrastColor;

    return Card(
      elevation: 0,
      color: foregroundColor.withAlpha(25),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: _isCopied ? null : () => unawaited(_handleCopy()),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              Text(
                widget.color.toHex(),
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: foregroundColor,
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _isCopied
                    ? const Icon(
                        Icons.check,
                        key: ValueKey('check'),
                        color: Colors.green,
                      )
                    : Icon(
                        Icons.copy,
                        key: const ValueKey('copy'),
                        color: foregroundColor,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
