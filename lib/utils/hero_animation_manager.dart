import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_playlist_animation/widgets/image_wrapper.dart';

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

  static Widget flightShuttleBuilder(
    BuildContext flightContext,
    Animation<double> animation,
    HeroFlightDirection flightDirection,
    BuildContext fromHeroContext,
    BuildContext toHeroContext,
  ) {
    final tween = Tween(
      begin: HeroAnimationManager.startRotation,
      end: HeroAnimationManager.endRotation,
    );
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    );
    final rotationAnimation = tween.animate(curvedAnimation);

    return AnimatedBuilder(
      animation: rotationAnimation,
      child: const ImageWrapper(
        image: 'assets/images/image-4.jpeg',
      ),
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
