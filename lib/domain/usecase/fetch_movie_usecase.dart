import 'package:flutter_movie_view_app/domain/entity/movie.dart';
import 'package:flutter_movie_view_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_view_app/domain/repository/movie_repository.dart';

class FetchMovieUseCase {
  FetchMovieUseCase(this._movieRepository);
  final MovieRepository _movieRepository;

  Future<List<Movie>?> fetchPopularMovies() async {
    return await _movieRepository.fetchPopularMovies();
  }

  Future<MovieDetail?> fetchMovieDetail(int id) async {
    return await _movieRepository.fetchMovieDetail(id);
  }

  Future<List<Movie>?> fetchNowPlayingMovies() async {
    return await _movieRepository.fetchNowPlayingMovies();
  }

  Future<List<Movie>?> fetchTopRatedMovies() async {
    return await _movieRepository.fetchTopRatedMovies();
  }

  Future<List<Movie>?> fetchUpcomingMovies() async {
    return await _movieRepository.fetchUpcomingMovies();
  }
}
