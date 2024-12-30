import 'package:dio/dio.dart';
import "package:flutter_dotenv/flutter_dotenv.dart";
import 'package:flutter_movie_view_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_view_app/data/dto/movie_detail_dto.dart';
import 'package:flutter_movie_view_app/data/dto/movie_response_dto.dart';

class MovieRepository implements MovieDataSource {
  final Dio _client = Dio(BaseOptions(
    validateStatus: (status) => true,
  ));

  @override
  Future<MovieDetailDto?> fetchMovieDetail(int id) async {
    // TODO: implement fetchPopularMovies
    throw UnimplementedError();
  }

  //TODO dot.env확인
  @override
  Future<MovieResponseDto?> fetchNowPlayingMovies() async {
    // TODO: implement fetchNowPlayingMovies
    throw UnimplementedError();
  }

  @override
  Future<MovieResponseDto?> fetchPopularMovies() async {
    final response = await _client
        .get('https://api.themoviedb.org/3/movie', queryParameters: {
      'include_adult': false,
      'include_video': false,
      'language': 'ko-KR',
      'page': 1,
      'sort_by': 'popularity.desc',
      'Authorization': dotenv.env['TMDV_ACCESS_TOKEN'],
      'Accept': 'application/json',
    });
    print(response.statusCode);

// results>>(반복문)poster_path
// include_adult: false
// include_video: false
// language: ko-KR
// page: 1
// sort_by: popularity.desc
  }

  @override
  Future<MovieResponseDto?> fetchTopRatedMovies() async {
    // TODO: implement fetchTopRatedMovies
    throw UnimplementedError();
  }

  @override
  Future<MovieResponseDto?> fetchUpcomingMovies() async {
    // TODO: implement fetchUpcomingMovies
    throw UnimplementedError();
  }
}
