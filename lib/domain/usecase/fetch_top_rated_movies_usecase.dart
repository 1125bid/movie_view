import 'package:flutter_movie_view_app/domain/entity/movie.dart';
import 'package:flutter_movie_view_app/domain/repository/movie_repository.dart';

class FetchTopRatedMoviesUseCase {
  FetchTopRatedMoviesUseCase(this._movieRepository);
  final MovieRepository _movieRepository;

  Future<List<Movie>?> fetchTopRatedMovies() async {
    return await _movieRepository.fetchTopRatedMovies();
  }
}
