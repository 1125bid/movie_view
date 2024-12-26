import 'package:flutter/material.dart';
import 'package:flutter_movie_view_app/detail_page.dart';
import 'package:flutter_movie_view_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home_page': (context) => const HomePage(),
        '/detail_page': (context) => DetailPage(),
      },
      theme: ThemeData(
        fontFamily: 'Pretendard',
      ),
      darkTheme: ThemeData.dark(),
      title: 'Movie-view',
      home: const HomePage(),
    );
  }
}
