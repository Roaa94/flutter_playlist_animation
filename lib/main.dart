import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_playlist_animation/pages/library_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MaterialApp(
      title: 'Flutter Demo',
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
