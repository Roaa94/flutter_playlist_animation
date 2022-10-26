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
  });

  final String image;
  final int id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                image: image,
              );
            },
          ),
        );
      },
      child: Hero(
        tag: 'image-$id-hero',
        flightShuttleBuilder: HeroAnimationManager.flightShuttleBuilder,
        child: Transform(
          transform: HeroAnimationManager.startTransformMatrix,
          alignment: Alignment.center,
          child: ImageWrapper(image: image),
        ),
      ),
    );
  }
}
