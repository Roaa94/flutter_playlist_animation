import 'package:flutter/material.dart';
import 'package:flutter_playlist_animation/not-animated/utils/library_data.dart';
import 'package:flutter_playlist_animation/not-animated/widgets/image_wrapper.dart';
import 'package:flutter_playlist_animation/not-animated/widgets/song_action_buttons.dart';
import 'package:flutter_playlist_animation/not-animated/widgets/song_list_item.dart';

class PlaylistPage extends StatefulWidget {
  const PlaylistPage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  State<PlaylistPage> createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 240,
                  automaticallyImplyLeading: false,
                  floating: true,
                  pinned: true,
                  flexibleSpace: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Center(
                      child: ImageWrapper(image: widget.image),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            'Acoustic',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const SongActionButtons(),
                        const SizedBox(height: 20),
                        const Text(
                          'Upcoming songs',
                          style: TextStyle(fontSize: 22),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.only(
                            top: 10,
                            bottom: MediaQuery.of(context).padding.bottom + 20,
                          ),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: LibraryData.playlistImages.length,
                          itemBuilder: (context, index) => SongListItem(
                            image: LibraryData.playlistImages[index],
                          ),
                        ),
                      ],
                    ),
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
