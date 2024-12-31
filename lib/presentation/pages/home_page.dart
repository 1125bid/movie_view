import 'package:flutter/material.dart';
import 'package:flutter_movie_view_app/domain/entity/movie.dart';
import 'package:flutter_movie_view_app/presentation/pages/home_page_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final homePageState = ref.watch(homePageViewModelProvider);
    final homePageViewModel = ref.read(homePageViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const Text('가장 인기 있는'),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/detail_page',
                    arguments: homePageState.popularMovies[0]);
              },
              child: Hero(
                tag: 'image',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    height: 500,
                    width: double.infinity,
                    child: homePageState.popularMovies.isNotEmpty
                        ? Image.network(
                            'https://image.tmdb.org/t/p/w500${homePageState.popularMovies[0].posterPath}',
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            'https://picsum.photos/seed/picsum/200/300'),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text('현재 상영중'),
            const SizedBox(height: 10),
            SizedBox(
              height: 250,
              child: ListView.separated(
                itemCount: homePageState.nowPlayingMovies.length,
                itemBuilder: (context, index) {
                  return Item(
                    movie: homePageState.nowPlayingMovies[index],
                  );
                },
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(width: 3),
              ),
            ),
            const SizedBox(height: 10),
            const Text('인기순'),
            const SizedBox(height: 10),
            SizedBox(
              height: 250,
              child: ListView.separated(
                itemCount: homePageState.popularMovies.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return StackedItem(
                      num: '${index + 1}',
                      movie: homePageState.popularMovies[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(),
              ),
            ),
            const SizedBox(height: 10),
            const Text('평점 높은 순'),
            const SizedBox(height: 10),
            SizedBox(
              height: 250,
              child: ListView.separated(
                itemCount: homePageState.topRatedMovies.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Item(
                    movie: homePageState.topRatedMovies[index],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 3),
              ),
            ),
            const SizedBox(height: 10),
            const Text('개봉예정'),
            const SizedBox(height: 10),
            SizedBox(
              height: 250,
              child: ListView.separated(
                itemCount: homePageState.upcomingMovies.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Item(
                    movie: homePageState.upcomingMovies[index],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///인기순 아이템
class StackedItem extends StatelessWidget {
  StackedItem({super.key, required this.num, required this.movie});
  String num;
  Movie movie;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail_page');
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 25),
            child: AspectRatio(
              aspectRatio: 1 / 1.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              num,
              style: TextStyle(fontSize: 100, color: Colors.grey[300]),
            ),
          ),
        ],
      ),
    );
  }
}

///현재상영중, 평점 높은순, 개봉예정
class Item extends StatelessWidget {
  Item({
    super.key,
    required this.movie,
  });
  Movie movie;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/detail_page');
        },
        child: AspectRatio(
          aspectRatio: 1 / 1.5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              'https://image.tmdb.org/t/p/w500${movie.posterPath}',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
