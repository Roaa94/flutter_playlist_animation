import 'package:flutter/material.dart';
import 'package:flutter_playlist_animation/pages/playlist_page.dart';
import 'package:flutter_playlist_animation/utils/animation_manager.dart';
import 'package:flutter_playlist_animation/utils/library_data.dart';
import 'package:flutter_playlist_animation/utils/page_transitions.dart';
import 'package:flutter_playlist_animation/widgets/library_item.dart';

class FeaturedLibraryItems extends StatefulWidget {
  const FeaturedLibraryItems({
    super.key,
    required this.animationController,
  });

  final AnimationController animationController;

  @override
  State<FeaturedLibraryItems> createState() => _FeaturedLibraryItemsState();
}

class _FeaturedLibraryItemsState extends State<FeaturedLibraryItems> {
  bool _expanded = false;
  late final Animation<double> offsetAnimation;
  late Tween<double> offsetAnimationTween;
  int tappedItemIndex = 0;

  @override
  void initState() {
    offsetAnimationTween = Tween<double>(begin: 0, end: -500);
    offsetAnimation = offsetAnimationTween.animate(
      CurvedAnimation(
          parent: widget.animationController, curve: Curves.easeInOut),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(
        4,
        (index) {
          return AnimatedPositioned(
            duration: AnimationManager.expandFeaturedLibraryItemsDuration,
            curve: Curves.easeInOut,
            top: 100 + (15.0 * index) + (_expanded ? 40 * (index - 1) : 0),
            left: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: widget.animationController,
              builder: (context, child) {
                offsetAnimationTween.end = tappedItemIndex < index ? 700 : -500;
                return Transform.translate(
                  offset: Offset(
                    0,
                    offsetAnimation.value,
                  ),
                  child: child,
                );
              },
              child: Transform.scale(
                scale: 1 - (0.05 * (1 - index)),
                alignment: Alignment.topCenter,
                child: Center(
                  child: LibraryItem(
                    rotation:
                        _expanded ? AnimationManager.startRotation : 0,
                    id: index,
                    image: LibraryData.playlistImages[index],
                    onTap: () {
                      if (!_expanded) {
                        setState(() {
                          _expanded = true;
                        });
                      } else {
                        tappedItemIndex = index;
                        widget.animationController.forward();
                        Navigator.of(context).push(
                          createFadeInRoute(
                            routePageBuilder: (
                              BuildContext context,
                              Animation<double> animation,
                              _,
                            ) {
                              return PlaylistPage(
                                routeAnimation: animation,
                                image: LibraryData.playlistImages[index],
                                heroTag: 'image-$index-hero',
                              );
                            },
                          ),
                        ).then((value) {
                          widget.animationController.reverse();
                        });
                      }
                    },
                    onLongPress: () {
                      if (_expanded) {
                        setState(() {
                          _expanded = false;
                        });
                      }
                    },
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
