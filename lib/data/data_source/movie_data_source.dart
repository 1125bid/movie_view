import 'package:flutter_movie_view_app/data/dto/movie_detail_dto.dart';
import 'package:flutter_movie_view_app/data/dto/movie_response_dto.dart';

///DataSource interface >dto를 return
abstract interface class MovieDataSource {
  Future<List<MovieResponseDto>?> fetchNowPlayingMovies();

// FIXME List<MovieResponseDto>?
  Future<List<MovieResponseDto>?> fetchPopularMovies();
// FIXME List<MovieResponseDto>?
  Future<List<MovieResponseDto>?> fetchTopRatedMovies();
// FIXME List<MovieResponseDto>?
  Future<List<MovieResponseDto>?> fetchUpcomingMovies();

  Future<MovieDetailDto?> fetchMovieDetail(int id);
}
