import 'package:flutter/material.dart';
import 'package:flutter_playlist_animation/utils/hero_animation_manager.dart';
import 'package:flutter_playlist_animation/utils/library_data.dart';
import 'package:flutter_playlist_animation/widgets/featured_library_items.dart';
import 'package:flutter_playlist_animation/widgets/image_wrapper.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late Animation<Offset> offsetAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: HeroAnimationManager.pageElementsAnimationDuration,
    );
    offsetAnimation = Tween(
      begin: const Offset(0, 0),
      end: const Offset(0, 1),
    ).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );
    super.initState();
  }

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
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: FeaturedLibraryItems(
              onItemPush: () => animationController.forward(),
              onItemPop: () => animationController.reverse(),
            ),
          ),
          Expanded(
            child: SlideTransition(
              position: offsetAnimation,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Text(
                      'Recently Played',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: MediaQuery.of(context).padding.bottom + 20,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: LibraryData.playlistImages.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ImageWrapper(
                          image: LibraryData.playlistImages[index],
                          size: 100,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
