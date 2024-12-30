import 'package:flutter_movie_view_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_view_app/domain/repository/movie_repository.dart';

class FetchMovieUseCase {
  FetchMovieUseCase(this._movieRepository);
  final MovieRepository _movieRepository;

  Future<MovieDetail?> fetchMovieDetail(int id) async {
    return await _movieRepository.fetchMovieDetail(id);
  }
}
