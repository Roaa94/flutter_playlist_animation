import 'package:flutter/material.dart';
import 'package:flutter_playlist_animation/not-animated/widgets/image_wrapper.dart';

class LibraryItem extends StatelessWidget {
  const LibraryItem({
    super.key,
    required this.image,
    required this.id,
    this.onTap,
    this.onLongPress,
  });

  final String image;
  final int id;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ImageWrapper(image: image),
    );
  }
}
