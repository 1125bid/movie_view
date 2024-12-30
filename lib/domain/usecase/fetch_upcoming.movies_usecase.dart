import 'package:flutter_movie_view_app/domain/entity/movie.dart';
import 'package:flutter_movie_view_app/domain/repository/movie_repository.dart';

class FetchUpcomingMoviesUseCase {
  FetchUpcomingMoviesUseCase(this._movieRepository);
  final MovieRepository _movieRepository;

  Future<List<Movie>?> fetchUpcomingMovies() async {
    return await _movieRepository.fetchUpcomingMovies();
  }
}
