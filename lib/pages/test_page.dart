import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_playlist_animation/widgets/image_wrapper.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  double _rotationValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.002)
                ..rotateX(_rotationValue * -pi),
              alignment: Alignment.center,
              child: const ImageWrapper(
                image: 'assets/images/image-4.jpeg',
              ),
            ),
          ),
          Slider(
            min: 0,
            max: 2,
            value: _rotationValue,
            onChanged: (value) => setState(() => _rotationValue = value),
          ),
        ],
      ),
    );
  }
}
