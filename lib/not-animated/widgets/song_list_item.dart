import 'package:flutter/material.dart';

class SongListItem extends StatelessWidget {
  const SongListItem({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: 80,
              height: 80,
              child: Image.asset(image, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Song Title',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.headphones,
                      size: 18,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '10,000,000',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        height: 1.3,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Icon(
            Icons.favorite,
            color: Colors.pinkAccent,
          ),
          const SizedBox(width: 10),
          Icon(
            Icons.more_horiz,
            color: Colors.black.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
