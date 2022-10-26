import 'package:flutter/material.dart';
import 'package:flutter_playlist_animation/utils/animation_manager.dart';
import 'package:flutter_playlist_animation/widgets/image_wrapper.dart';

class LibraryItem extends StatelessWidget {
  const LibraryItem({
    super.key,
    required this.image,
    required this.id,
    this.onTap,
    this.rotation = 0,
    this.onLongPress,
  });

  final String image;
  final int id;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final double rotation;

  @override
  Widget build(BuildContext context) {
    String heroTag = 'image-$id-hero';
    return GestureDetector(
      onLongPress: onLongPress,
      onTap: onTap,
      child: TweenAnimationBuilder<double>(
        duration: AnimationManager.expandFeaturedLibraryItemsDuration,
        tween: Tween<double>(begin: 0, end: rotation),
        child: ImageWrapper(image: image),
        builder: (context, double value, child) => Hero(
          tag: heroTag,
          flightShuttleBuilder:
              (_, Animation<double> animation, __, ___, ____) =>
                  AnimationManager.flightShuttleBuilder(animation, image),
          child: Transform(
            transform: AnimationManager.getTransformMatrix(value),
            alignment: Alignment.center,
            child: child,
          ),
        ),
      ),
    );
  }
}
