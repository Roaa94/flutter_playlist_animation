import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_playlist_animation/widgets/image_wrapper.dart';

class PlaylistPage extends StatelessWidget {
  const PlaylistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Align(
          alignment: Alignment.topCenter,
          child: Hero(
            tag: 'image-hero',
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.002)
                ..rotateX(2 * -pi),
              alignment: Alignment.center,
              child: const ImageWrapper(),
            ),
          ),
        ),
      ),
    );
  }
}
