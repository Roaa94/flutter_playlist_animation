import 'package:flutter/material.dart';
import 'package:flutter_playlist_animation/utils/hero_animation_manager.dart';
import 'package:flutter_playlist_animation/widgets/image_wrapper.dart';
import 'package:flutter_playlist_animation/widgets/song_action_buttons.dart';

class PlaylistPage extends StatefulWidget {
  const PlaylistPage({
    super.key,
    required this.routeAnimation,
  });

  final Animation<double> routeAnimation;

  @override
  State<PlaylistPage> createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  late final Animation<double> appBarOffsetAnimation;
  late final Animation<Offset> contentOffsetAnimation;

  @override
  void initState() {
    appBarOffsetAnimation = Tween(begin: -100.0, end: 0.0).animate(
      CurvedAnimation(
        parent: widget.routeAnimation,
        curve: const Interval(0.5, 1, curve: Curves.easeOut),
      ),
    );
    contentOffsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: widget.routeAnimation,
        curve: const Interval(0.5, 1, curve: Curves.easeOut),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AnimatedBuilder(
            animation: appBarOffsetAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, appBarOffsetAnimation.value),
                child: AppBar(),
              );
            },
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 240,
                  automaticallyImplyLeading: false,
                  floating: true,
                  flexibleSpace: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Center(
                      child: Hero(
                        tag: 'image-hero',
                        child: Transform(
                          transform: HeroAnimationManager.endTransformMatrix,
                          alignment: Alignment.center,
                          child: const ImageWrapper(
                            image: 'assets/images/image-4.jpeg',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      SlideTransition(
                        position: contentOffsetAnimation,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Center(
                              child: Text(
                                'Acoustic',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            SongActionButtons(),
                            SizedBox(height: 20),
                            Text(
                              'Upcoming songs',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
