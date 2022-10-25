import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_playlist_animation/pages/playlist_page.dart';
import 'package:flutter_playlist_animation/widgets/image_wrapper.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 300),
              pageBuilder:
                  (BuildContext context, Animation<double> animation, _) {
                return const PlaylistPage();
              },
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation, _, Widget child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            ));
          },
          child: Hero(
            tag: 'image-hero',
            flightShuttleBuilder: (
              BuildContext flightContext,
              Animation<double> animation,
              HeroFlightDirection flightDirection,
              BuildContext fromHeroContext,
              BuildContext toHeroContext,
            ) {
              const begin = 0.1;
              const end = 2.0;
              final tween = Tween(begin: begin, end: end);
              final rotationAnimation = animation.drive(tween);

              return AnimatedBuilder(
                animation: rotationAnimation,
                child: const ImageWrapper(),
                builder: (context, child) {
                  return Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.002)
                      ..rotateX(rotationAnimation.value * pi),
                    alignment: Alignment.center,
                    child: child,
                  );
                },
              );
            },
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.002)
                ..rotateX(0.1 * pi),
              alignment: Alignment.center,
              child: const ImageWrapper(),
            ),
          ),
        ),
      ),
    );
  }
}
