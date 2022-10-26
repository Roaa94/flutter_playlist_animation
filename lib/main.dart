import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_playlist_animation/pages/library_page.dart';
import 'package:flutter_playlist_animation/utils/library_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      for (String image in LibraryData.playlistImages) {
        precacheImage(Image.asset(image).image, context);
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MaterialApp(
      title: 'Flutter Playlist Animation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Rubik',
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Rubik',
          ),
          elevation: 0,
        ),
        primarySwatch: Colors.blue,
      ),
      home: const LibraryPage(),
    );
  }
}
