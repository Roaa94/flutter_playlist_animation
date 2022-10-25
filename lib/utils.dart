import 'dart:math';

import 'package:flutter/material.dart';

Matrix4 getTransformMatrix(double rotation) {
  return Matrix4.identity()
    ..setEntry(3, 2, 0.002)
    ..rotateX(rotation * -pi);
}

Matrix4 startTransformMatrix = getTransformMatrix(0.1);

Matrix4 endTransformMatrix = getTransformMatrix(2);
