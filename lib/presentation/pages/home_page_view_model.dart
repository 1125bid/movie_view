import 'package:flutter_movie_view_app/domain/entity/movie.dart';
import 'package:flutter_movie_view_app/presentation/providers.dart';
import 'package:riverpod/riverpod.dart';

class HomePageState {
  final List<Movie>? nowPlayingMovies;
  final List<Movie>? popularMovies;
  final List<Movie>? topRatedMovies;
  final List<Movie>? upcomingMovies;

  HomePageState({
    required this.nowPlayingMovies,
    required this.popularMovies,
    required this.topRatedMovies,
    required this.upcomingMovies,
  });
}

class HomePageViewModel extends Notifier<HomePageState> {
  @override
  HomePageState build() {
    return HomePageState(
      nowPlayingMovies: [],
      popularMovies: [],
      topRatedMovies: [],
      upcomingMovies: [],
    );
  }

  Future<List<Movie>?> fetchNowPlayingMovies() async {
    final fetchNowPlayingMoviesUseCase =
        ref.read(fetchNowPlayingMoviesUseCaseProvider);
    final result = await fetchNowPlayingMoviesUseCase.fetchNowPlayingMovies();
    state = HomePageState(
        nowPlayingMovies: result,
        popularMovies: state.popularMovies,
        topRatedMovies: state.topRatedMovies,
        upcomingMovies: state.upcomingMovies);
  }

  Future<List<Movie>?> fetchPopularMovies() async {
    final fetchPopularMoviesUseCase =
        ref.read(fetchPopularMoviesUseCaseProvider);
    final result = await fetchPopularMoviesUseCase.fetchPopularMovies();
    state = HomePageState(
        nowPlayingMovies: state.nowPlayingMovies,
        popularMovies: result,
        topRatedMovies: state.topRatedMovies,
        upcomingMovies: state.upcomingMovies);
  }

  Future<List<Movie>?> fetchTopRatedMovies() async {
    final fetchTopRatedMoviesUseCase =
        ref.read(fetchTopRatedMoviesUseCaseProvider);
    final result = await fetchTopRatedMoviesUseCase.fetchTopRatedMovies();
    state = HomePageState(
        nowPlayingMovies: state.nowPlayingMovies,
        popularMovies: result,
        topRatedMovies: state.topRatedMovies,
        upcomingMovies: state.upcomingMovies);
  }

  Future<List<Movie>?> fetchUpcomingMovies() async {
    final fetchUpcomingMoviesUseCase =
        ref.read(fetchUpcomingMoviesUseCaseProvider);
    final result = await fetchUpcomingMoviesUseCase.fetchUpcomingMovies();
    state = HomePageState(
        nowPlayingMovies: state.nowPlayingMovies,
        popularMovies: result,
        topRatedMovies: state.topRatedMovies,
        upcomingMovies: state.upcomingMovies);
  }
}

final homePageViewModelProvider =
    NotifierProvider<HomePageViewModel, HomePageState>(
        () => HomePageViewModel());
