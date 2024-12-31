import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_movie_view_app/domain/entity/movie.dart';
import 'package:flutter_movie_view_app/presentation/pages/detail_page.dart';
import 'package:flutter_movie_view_app/presentation/pages/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home_page': (context) => const HomePage(),
        '/detail_page': (context) {
          final arg = ModalRoute.of(context)!.settings.arguments as List;
          return DetailPage(
            movie: arg[0],
            heroTag: arg[1],
          );
        },
      },
      // themeMode: ThemeMode.dark,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Pretendard',
      ),
      title: 'Movie-view',
      home: const HomePage(),
    );
  }
}
