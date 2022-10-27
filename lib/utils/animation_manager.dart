import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_playlist_animation/widgets/image_wrapper.dart';

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

  static Matrix4 endTransformMatrix = getTransformMatrix(endRotation);

  static Widget flightShuttleBuilder(
    Animation<double> animation,
    String image,
  ) {
    final tween = Tween(
      begin: AnimationManager.startRotation,
      end: AnimationManager.endRotation,
    );
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    );
    final rotationAnimation = tween.animate(curvedAnimation);

    return AnimatedBuilder(
      animation: rotationAnimation,
      child: ImageWrapper(image: image),
      builder: (context, child) {
        return Transform(
          transform: getTransformMatrix(
            rotationAnimation.value,
          ),
          alignment: Alignment.center,
          child: child,
        );
      },
    );
  }
}
