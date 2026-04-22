import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DisplayActiveColor extends StatelessWidget {
  final Color color;
  const DisplayActiveColor({super.key, required this.color});

  String _toHex(Color curColor) {
    return '#${curColor.toARGB32().toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final foregroundColor = color.computeLuminance() > 0.5
        ? Colors.black
        : Colors.white;

    return Card(
      elevation: 0,
      color: foregroundColor.withAlpha(25),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () async {
          final hex = _toHex(color);
          await Clipboard.setData(ClipboardData(text: hex));

          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Copied $hex to clipboard!'),
                duration: const Duration(seconds: 2),
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              Text(
                _toHex(color),
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: foregroundColor,
                ),
              ),
              Icon(Icons.copy_rounded, color: foregroundColor),
            ],
          ),
        ),
      ),
    );
  }
}
