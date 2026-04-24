import 'package:flutter/material.dart';

class AnimatedLike extends StatelessWidget {
  final bool isActive;
  final VoidCallback? onPressed;
  final Color color;
  final Color iconColor;
  final double activeBackgroundAlpha;
  const AnimatedLike({
    super.key,
    this.onPressed,
    this.isActive = false,
    this.color = Colors.black,
    this.iconColor = Colors.black,
    this.activeBackgroundAlpha = 0.6,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: isActive
            ? Colors.white.withValues(alpha: activeBackgroundAlpha)
            : null,
      ),
      tooltip: isActive ? 'Remove from favorites' : 'Add to favorites',
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: Icon(
          isActive ? Icons.favorite : Icons.favorite_border,
          color: isActive ? Colors.red : iconColor,
          key: ValueKey('fav_btn_$isActive'),
        ),
      ),
    );
  }
}
