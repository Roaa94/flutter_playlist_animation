import 'package:flutter/material.dart';

class ImageWrapper extends StatelessWidget {
  const ImageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: 250,
        height: 250,
        child: Image.asset(
          'assets/images/singer-1.jpeg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
