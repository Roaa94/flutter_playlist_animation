import 'dart:math';

import 'package:flutter/material.dart';

class AnimationManager {
  static const double startRotation = 0.1;
  static const double endRotation = 2;
  static const double perspectiveValue = 0.003;

  static const Duration expandFeaturedLibraryItemsDuration =
      Duration(milliseconds: 200);
  static const Duration routeTransitionDuration = Duration(milliseconds: 600);
  static Duration pageElementsAnimationDuration = Duration(
      milliseconds: (routeTransitionDuration.inMilliseconds / 2).ceil());

  static Matrix4 getTransformMatrix(double rotation) {
    return Matrix4.identity()
      ..setEntry(3, 2, perspectiveValue)
      ..rotateX(rotation * pi);
  }

  static Matrix4 startTransformMatrix = getTransformMatrix(startRotation);

  static Matrix4 endTransformMatrix = getTransformMatrix(-endRotation);
}
