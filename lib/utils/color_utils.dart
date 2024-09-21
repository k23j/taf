import 'package:flutter/material.dart';

Color colorWithSaturation(Color color, double value) {
  assert(value >= 0.0 && value <= 1.0, 'Value must be between 0.0 and 1.0');

  // Convert RGB to HSL
  HSLColor hsl = HSLColor.fromColor(color);

  // Adjust saturation
  HSLColor hslAdjusted = hsl.withSaturation(value);

  // Convert back to RGB
  return hslAdjusted.toColor();
}
