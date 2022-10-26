import 'package:flutter/material.dart';
import 'package:flutter_playlist_animation/utils/hero_animation_manager.dart';
import 'package:flutter_playlist_animation/utils/library_data.dart';
import 'package:flutter_playlist_animation/widgets/library_item.dart';

class FeaturedLibraryItems extends StatefulWidget {
  const FeaturedLibraryItems({
    super.key,
    this.onItemPush,
    this.onItemPop,
  });

  final VoidCallback? onItemPush;
  final VoidCallback? onItemPop;

  @override
  State<FeaturedLibraryItems> createState() => _FeaturedLibraryItemsState();
}

class _FeaturedLibraryItemsState extends State<FeaturedLibraryItems> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(
        4,
        (index) {
          return AnimatedPositioned(
            duration: HeroAnimationManager.expandFeaturedLibraryItemsDuration,
            curve: Curves.easeInOut,
            top: 100 + (15.0 * index) + (_expanded ? 40 * (index - 1) : 0),
            left: 0,
            right: 0,
            child: Transform.scale(
              scale: 1 - (0.05 * (1 - index)),
              alignment: Alignment.topCenter,
              child: Center(
                child: LibraryItem(
                  rotation: _expanded ? HeroAnimationManager.startRotation : 0,
                  id: index,
                  image: LibraryData.playlistImages[index],
                  onTap: _expanded
                      ? null
                      : () {
                          setState(() {
                            _expanded = true;
                          });
                        },
                  onLongPress: () {
                    if (_expanded) {
                      setState(() {
                        _expanded = false;
                      });
                    }
                  },
                  onPush: _expanded ? widget.onItemPush : null,
                  onPop: widget.onItemPop,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
