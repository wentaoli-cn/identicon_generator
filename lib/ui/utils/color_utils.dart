import 'dart:math';

import 'package:flutter/material.dart';

class ColorUtils {
  /// Compute the similarity between two colors via Euclidean distance.
  static bool areColorsSimilar({
    required Color color1,
    required Color color2,
    double threshold = 40.0,
  }) =>
      sqrt(pow(color1.red - color2.red, 2) +
          pow(color1.green - color2.green, 2) +
          pow(color1.blue - color2.blue, 2)) <
      threshold;

  /// Convert a color to its RGB hex value.
  static String colorToRgbHex(Color color) =>
      '${color.red.toRadixString(16).padLeft(2, '0').toUpperCase()}'
      '${color.green.toRadixString(16).padLeft(2, '0').toUpperCase()}'
      '${color.blue.toRadixString(16).padLeft(2, '0').toUpperCase()}';

  /// Verify whether the input is an RGB hex value.
  static bool isRgbHex(String input) =>
      RegExp(r'^[0-9a-fA-F]{6}$').hasMatch(input);
}
