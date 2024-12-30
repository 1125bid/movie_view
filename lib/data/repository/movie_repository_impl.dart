import 'package:flutter_movie_view_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_view_app/domain/entity/movie.dart';
import 'package:flutter_movie_view_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_view_app/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieDataSource _movieDataSource;
  MovieRepositoryImpl(this._movieDataSource);
  //datasource의 값을 파라미터로 받기 위한 밑작업.

  @override
  Future<MovieDetail?> fetchMovieDetail(int id) async {
    final result = await _movieDataSource.fetchMovieDetail(id);
    if (result != null) {
      return MovieDetail(
        budget: result.budget,
        genres: result.genres.map((e) => e.name).toList(),
        id: id,
        productionCompanyLogos:
            result.productionCompanies.map((e) => e.logoPath!).toList(),
        overview: result.overview,
        popularity: result.popularity,
        releaseDate: result.releaseDate,
        revenue: result.revenue,
        runtime: result.runtime,
        tagline: result.tagline,
        title: result.title,
        voteAverage: result.voteAverage,
        voteCount: result.voteCount,
      );
    }
    return null;
  }

  @override
  Future<List<Movie>?> fetchNowPlayingMovies() async {
    final result = await _movieDataSource.fetchNowPlayingMovies();
    return result
        ?.map((movie) => Movie(
              id: movie.id,
              posterPath: movie.posterPath,
            ))
        .toList();
  }

  @override
  Future<List<Movie>?> fetchPopularMovies() async {
    final result = await _movieDataSource.fetchPopularMovies();
    return result
        ?.map((movie) => Movie(
              id: movie.id,
              posterPath: movie.posterPath,
            ))
        .toList();
  }

  @override
  Future<List<Movie>?> fetchTopRatedMovies() async {
    final result = await _movieDataSource.fetchTopRatedMovies();
    return result
        ?.map((movie) => Movie(
              id: movie.id,
              posterPath: movie.posterPath,
            ))
        .toList();
  }

  @override
  Future<List<Movie>?> fetchUpcomingMovies() async {
    final result = await _movieDataSource.fetchUpcomingMovies();
    return result
        ?.map((movie) => Movie(
              id: movie.id,
              posterPath: movie.posterPath,
            ))
        .toList();
  }
}
