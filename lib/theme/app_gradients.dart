import 'dart:math';

import 'package:flutter/material.dart';

abstract class AppGradients {
  Gradient get background;
}

class AppGradientsDefault implements AppGradients {
  @override
  Gradient get background => LinearGradient(
        colors: [
          Color(0xFF40B38C),
          Color(0xFF45CC93),
        ],
        stops: [0.0, 0.6],
        transform: GradientRotation(2.35619 * pi),
      );
}
