import 'package:flutter/material.dart';

extension ColorExtensions on Color {
  String toHex() {
    final hex = toARGB32().toRadixString(16).padLeft(8, '0').substring(2);
    return '#${hex.toUpperCase()}';
  }

  Color get contrastColor {
    return computeLuminance() > 0.5 ? Colors.black : Colors.white;
  }
}
