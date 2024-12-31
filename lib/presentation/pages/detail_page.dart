import 'package:flutter/material.dart';
import 'package:flutter_movie_view_app/domain/entity/movie.dart';
import 'package:flutter_movie_view_app/presentation/pages/detail_page_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerStatefulWidget {
  const DetailPage({super.key, required this.movie});
  final Movie movie;
  @override
  ConsumerState<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final detailPageState =
        ref.watch(detailPageViewModelProvider(widget.movie.id));
    final detailPageViewModel =
        ref.read(detailPageViewModelProvider(widget.movie.id).notifier);

    ///로딩중
    if (detailPageState.movieDetail == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final labels = ['평점', '평점투표수', '인기점수', '예산', '수익'];

    ///흥행정보 이름
    final infos = [
      detailPageState.movieDetail!.voteAverage.toString(),
      detailPageState.movieDetail!.voteCount.toString(),
      detailPageState.movieDetail!.popularity.toString(),
      detailPageState.movieDetail!.budget.toString(),
      detailPageState.movieDetail!.revenue.toString(),
    ];
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Hero(tag: 'image', child: MainPicture(movie: widget.movie)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(detailPageState.movieDetail?.title ?? '영화 제목',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Spacer(),
              Text(
                  '${detailPageState.movieDetail!.releaseDate.year} -${detailPageState.movieDetail!.releaseDate.month} - ${detailPageState.movieDetail!.releaseDate.day}'),
            ],
          ),
          const SizedBox(height: 10),
          Text(detailPageState.movieDetail!.tagline),
          const SizedBox(height: 5),
          Text('${detailPageState.movieDetail!.runtime}분'),
          const SizedBox(height: 5),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey,
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 50,
            child: ListView.separated(
              itemCount: detailPageState.movieDetail!.genres.length,
              itemBuilder: (context, index) {
                return CategoryItem(
                    categories: detailPageState.movieDetail!.genres[index]);
              },
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 5),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey,
          ),
          const SizedBox(height: 10),
          Flexible(child: Text(detailPageState.movieDetail!.overview)),
          const SizedBox(height: 5),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey,
          ),
          const SizedBox(height: 10),
          Text('흥행정보'),
          const SizedBox(height: 10),
          SizedBox(
            height: 50,
            child: ListView.separated(
              itemCount: infos.length,
              itemBuilder: (context, index) {
                return CategoryItem(
                    categories: '${infos[index]}\n${labels[index]}');
              },
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 5),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 100,
            width: 500,
            child: ListView.separated(
              itemCount: detailPageState.movieDetail!.productionCompanyLogos
                  .where((e) => e != null)
                  .toList()
                  .length,
              itemBuilder: (context, index) {
                return MakerItem(
                  productionCompanyLogoUrl: detailPageState
                      .movieDetail!.productionCompanyLogos
                      .where((e) => e != null)
                      .toList()[index]!,
                );
              },
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 10),
            ),
          )
        ],
      ),
    );
  }
}

/// 최상단 영화 포스터
class MainPicture extends StatelessWidget {
  const MainPicture({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        'https://image.tmdb.org/t/p/w500${movie.posterPath}',
        fit: BoxFit.cover,
      ),
    );
  }
}

///제작사 로고(최하단)
class MakerItem extends StatelessWidget {
  const MakerItem({
    super.key,
    required this.productionCompanyLogoUrl,
  });
  final String productionCompanyLogoUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.9),
      padding: EdgeInsets.symmetric(horizontal: 5),
      width: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          'https://image.tmdb.org/t/p/w500$productionCompanyLogoUrl',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

/// 장르 아이템
class CategoryItem extends StatelessWidget {
  CategoryItem({
    super.key,
    required this.categories,
  });
  String categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: Text(
          categories,
          textAlign: TextAlign.center,
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
      ),
    );
  }
}
