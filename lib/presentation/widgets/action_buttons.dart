import 'package:color_randomizer/presentation/providers/color_provider.dart';
import 'package:color_randomizer/presentation/widgets/base_button.dart';
import 'package:color_randomizer/presentation/widgets/history_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActionButtons extends ConsumerWidget {
  final Color textColor;
  final bool clearDisabled;
  const ActionButtons({
    required this.textColor,
    super.key,
    this.clearDisabled = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        BaseButton(
          icon: Icons.history,
          label: 'Show history',
          backgroundColor: textColor.withAlpha(30),
          foregroundColor: textColor,
          onPressed: () => _showHistory(context, theme),
        ),
        BaseButton(
          icon: Icons.delete_forever_outlined,
          label: 'Clear all history',
          backgroundColor: theme.colorScheme.error,
          foregroundColor: theme.colorScheme.onError,
          onPressed: clearDisabled
              ? null
              : () => _handleClearHistory(context, ref, theme),
        ),
      ],
    );
  }

  void _showHistory(BuildContext context, ThemeData theme) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      backgroundColor: theme.colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => const HistoryBottomSheet(),
    );
  }

  Future<void> _handleClearHistory(
    BuildContext context,
    WidgetRef ref,
    ThemeData theme,
  ) async {
    final confirmed = await _showClearDialog(context, theme);

    if ((confirmed ?? false) && context.mounted) {
      await ref.read(colorProvider.notifier).clearAll();

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('History cleared'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  Future<bool?> _showClearDialog(BuildContext context, ThemeData theme) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear history?'),
        content: const Text(
          // ignore: lines_longer_than_80_chars
          'This will permanently delete all generated colors. This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: theme.colorScheme.error,
              foregroundColor: theme.colorScheme.onError,
            ),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Clear All'),
          ),
        ],
      ),
    );
  }
}
