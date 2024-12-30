import 'package:flutter_movie_view_app/data/dto/movie_detail_dto.dart';
import 'package:flutter_movie_view_app/data/dto/movie_response_dto.dart';
import 'package:flutter_movie_view_app/data/repository/movie_repository.dart';

class FetchMovieUseCase {
  FetchMovieUseCase(this._movieRepository);
  final MovieRepository _movieRepository;

  Future<MovieResponseDto?> fetchPopularMovies() async {
    return await _movieRepository.fetchPopularMovies();
  }

  Future<MovieDetailDto?> fetchMovieDetail(int id) async {
    return await _movieRepository.fetchMovieDetail(id);
  }

  Future<MovieResponseDto?> fetchNowPlayingMovies() async {
    return await _movieRepository.fetchNowPlayingMovies();
  }

  Future<MovieResponseDto?> fetchTopRatedMovies() async {
    return await _movieRepository.fetchTopRatedMovies();
  }

  Future<MovieResponseDto?> fetchUpcomingMovies() async {
    return await _movieRepository.fetchUpcomingMovies();
  }
}
