//viewmodel에서 직접 객체 생성하지 않을 수 있게
//usecase 공급해주는 provider생성
//viewmodel 내에서는 provider에 의해 usecase 공급 받을 것
//usecase마다 1개씩 만들기

import 'package:flutter_movie_view_app/data/data_source/movie_data_source_impl.dart';
import 'package:flutter_movie_view_app/data/repository/movie_repository_impl.dart';
import 'package:flutter_movie_view_app/domain/repository/movie_repository.dart';
import 'package:flutter_movie_view_app/domain/usecase/fetch_movie_detail_usecase.dart';
import 'package:flutter_movie_view_app/domain/usecase/fetch_now_playing_movies_usecase.dart';
import 'package:flutter_movie_view_app/domain/usecase/fetch_popular_movies_usecase.dart';
import 'package:flutter_movie_view_app/domain/usecase/fetch_top_rated_movies_usecase.dart';
import 'package:flutter_movie_view_app/domain/usecase/fetch_upcoming_movies_usecase.dart';
import 'package:riverpod/riverpod.dart';

final fetchMovieDetailUseCaseProvider =
    Provider<FetchMovieDetailUseCase>((ref) {
  return FetchMovieDetailUseCase(ref.read(_movieRepositoryProvider));
});

final fetchNowPlayingMoviesUseCaseProvider =
    Provider<FetchNowPlayingMoviesUseCase>((ref) {
  return FetchNowPlayingMoviesUseCase(ref.read(_movieRepositoryProvider));
});

final fetchPopularMoviesUseCaseProvider =
    Provider<FetchPopularMoviesUseCase>((ref) {
  return FetchPopularMoviesUseCase(ref.read(_movieRepositoryProvider));
});

final fetchTopRatedMoviesUseCaseProvider =
    Provider<FetchTopRatedMoviesUseCase>((ref) {
  return FetchTopRatedMoviesUseCase(ref.read(_movieRepositoryProvider));
});

final fetchUpcomingMoviesUseCaseProvider =
    Provider<FetchUpcomingMoviesUseCase>((ref) {
  return FetchUpcomingMoviesUseCase(ref.read(_movieRepositoryProvider));
});

final _movieRepositoryProvider = Provider<MovieRepository>((ref) {
  return MovieRepositoryImpl(MovieDataSourceImpl());
  //MovieRepositoryImpl 가 생성자 안에서 MovieDataSource 구현한 클래스의 변수를 받아서.
});
