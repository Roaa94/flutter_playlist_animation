import 'package:flutter/material.dart';
import 'package:flutter_playlist_animation/not-animated/pages/playlist_page.dart';
import 'package:flutter_playlist_animation/not-animated/utils/library_data.dart';
import 'package:flutter_playlist_animation/not-animated/widgets/library_item.dart';

class FeaturedLibraryItems extends StatefulWidget {
  const FeaturedLibraryItems({
    super.key,
  });

  @override
  State<FeaturedLibraryItems> createState() => _FeaturedLibraryItemsState();
}

class _FeaturedLibraryItemsState extends State<FeaturedLibraryItems> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(
        4,
        (index) {
          return Positioned(
            top: 100 + (15.0 * index),
            left: 0,
            right: 0,
            child: Transform.scale(
              scale: 1 - (0.05 * (1 - index)),
              alignment: Alignment.topCenter,
              child: Center(
                child: LibraryItem(
                  id: index,
                  image: LibraryData.playlistImages[index],
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PlaylistPage(
                        image: LibraryData.playlistImages[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
