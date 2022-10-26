import 'package:flutter/material.dart';
import 'package:flutter_playlist_animation/widgets/library_item.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

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
      body: const Center(
        child: LibraryItem(
          image: 'assets/images/image-4.jpeg',
          id: 0,
        ),
      ),
    );
  }
}
