import 'package:flutter/material.dart';
import 'package:flutter_playlist_animation/pages/library_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Rubik',
        scaffoldBackgroundColor: const Color(0xff131A3B),
        primarySwatch: Colors.blue,
      ),
      home: const LibraryPage(),
    );
  }
}
