import 'dart:async';

import 'package:flutter/material.dart';

class CopyIndicator extends StatelessWidget {
  final CopyController controller;
  final Color color;

  const CopyIndicator({
    required this.controller,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final isCopied = controller.isCopied;
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          transitionBuilder: (child, anim) =>
              ScaleTransition(scale: anim, child: child),
          child: Icon(
            isCopied ? Icons.check : Icons.copy,
            color: isCopied ? Colors.green : color,
            key: ValueKey('copy_icon_$isCopied'),
          ),
        );
      },
    );
  }
}

class CopyController extends ChangeNotifier {
  bool _isCopied = false;
  bool get isCopied => _isCopied;

  Timer? _timer;
  bool _isDisposed = false;

  void triggerCopy() {
    if (_isDisposed) return;

    _timer?.cancel();

    _isCopied = true;
    notifyListeners();

    _timer = Timer(const Duration(seconds: 2), () {
      if (_isDisposed) return;

      _isCopied = false;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _isDisposed = true;
    _timer?.cancel();
    super.dispose();
  }
}

class AnimatedCopy extends StatelessWidget {
  final CopyController controller;
  final VoidCallback? onPressed;
  final Color? color;
  final String tooltip;

  const AnimatedCopy({
    required this.controller,
    required this.onPressed,
    super.key,
    this.color,
    this.tooltip = 'Copy color HEX',
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: tooltip,
      onPressed: onPressed,
      icon: CopyIndicator(
        controller: controller,
        color: color ?? Theme.of(context).iconTheme.color ?? Colors.grey,
      ),
    );
  }
}
