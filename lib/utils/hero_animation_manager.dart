import 'dart:math';

import 'package:flutter/material.dart';

class HeroAnimationManager {
  static const double startRotation = 0.1;
  static const double endRotation = 2;
  static const double perspectiveValue = 0.002;

  static Matrix4 getTransformMatrix(double rotation) {
    return Matrix4.identity()
      ..setEntry(3, 2, perspectiveValue)
      ..rotateX(rotation * pi);
  }

  static Matrix4 startTransformMatrix = getTransformMatrix(startRotation);

  static Matrix4 endTransformMatrix = getTransformMatrix(-endRotation);
}
