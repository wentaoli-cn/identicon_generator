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
}
