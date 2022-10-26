import 'package:flutter/material.dart';

class SongActionButtons extends StatelessWidget {
  const SongActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shuffle, size: 30),
        ),
        Container(
          width: 70,
          height: 70,
          margin: const EdgeInsets.symmetric(horizontal: 40),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.cyan,
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.pause, size: 30),
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.repeat, size: 30),
        ),
      ],
    );
  }
}
