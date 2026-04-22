import 'package:flutter/material.dart';

extension ColorX on Color {
  String toHex() {
    return '#${toARGB32().toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}';
  }

  Color get contrastColor {
    return computeLuminance() > 0.5 ? Colors.black : Colors.white;
  }
}
