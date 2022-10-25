import 'package:flutter/material.dart';
import 'package:flutter_playlist_animation/utils/hero_animation_manager.dart';
import 'package:flutter_playlist_animation/widgets/image_wrapper.dart';

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
  late final Animation<double> offsetAnimation;

  @override
  void initState() {
    offsetAnimation = Tween(begin: -100.0, end: 0.0).animate(
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
            animation: offsetAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, offsetAnimation.value),
                child: AppBar(),
              );
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Center(
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
