import 'package:flutter/material.dart';
import 'package:flutter_playlist_animation/pages/playlist_page.dart';
import 'package:flutter_playlist_animation/utils/hero_animation_manager.dart';
import 'package:flutter_playlist_animation/utils/page_transitions.dart';
import 'package:flutter_playlist_animation/widgets/image_wrapper.dart';

class LibraryItem extends StatelessWidget {
  const LibraryItem({
    super.key,
    required this.image,
    required this.id,
    this.onPush,
    this.onPop,
  });

  final String image;
  final int id;
  final VoidCallback? onPush;
  final VoidCallback? onPop;

  @override
  Widget build(BuildContext context) {
    String heroTag = 'image-$id-hero';
    return GestureDetector(
      onTap: () {
        onPush?.call();
        Navigator.of(context).push(
          createFadeInRoute(
            routePageBuilder: (
              BuildContext context,
              Animation<double> animation,
              _,
            ) {
              return PlaylistPage(
                routeAnimation: animation,
                image: image,
                heroTag: heroTag,
              );
            },
          ),
        ).then((_) {
          onPop?.call();
        });
      },
      child: Hero(
        tag: heroTag,
        flightShuttleBuilder: (_, Animation<double> animation, __, ___, ____) =>
            HeroAnimationManager.flightShuttleBuilder(animation, image),
        child: Transform(
          transform: HeroAnimationManager.startTransformMatrix,
          alignment: Alignment.center,
          child: ImageWrapper(image: image),
        ),
      ),
    );
  }
}
