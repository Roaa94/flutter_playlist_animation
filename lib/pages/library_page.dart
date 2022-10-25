import 'package:flutter/material.dart';
import 'package:flutter_playlist_animation/pages/playlist_page.dart';
import 'package:flutter_playlist_animation/utils/hero_animation_manager.dart';
import 'package:flutter_playlist_animation/utils/page_transitions.dart';
import 'package:flutter_playlist_animation/widgets/image_wrapper.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Playlists'),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.filter_list),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              createFadeInRoute(
                routePageBuilder: (
                  BuildContext context,
                  Animation<double> animation,
                  _,
                ) {
                  return PlaylistPage(
                    routeAnimation: animation,
                  );
                },
              ),
            );
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
                child: const ImageWrapper(),
                builder: (context, child) {
                  return Transform(
                    transform: HeroAnimationManager.getTransformMatrix(
                      rotationAnimation.value,
                    ),
                    alignment: Alignment.center,
                    child: child,
                  );
                },
              );
            },
            child: Transform(
              transform: HeroAnimationManager.startTransformMatrix,
              alignment: Alignment.center,
              child: const ImageWrapper(),
            ),
          ),
        ),
      ),
    );
  }
}
