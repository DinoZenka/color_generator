import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color backgroundColor;
  final Color foregroundColor;
  final VoidCallback? onPressed;

  const BaseButton({
    super.key,
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          icon: Icon(icon),
          onPressed: onPressed,
          label: Text(label),
        ),
      ),
    );
  }
}
