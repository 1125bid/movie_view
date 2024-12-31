import 'package:dio/dio.dart';
import "package:flutter_dotenv/flutter_dotenv.dart";
import 'package:flutter_movie_view_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_view_app/data/dto/movie_detail_dto.dart';
import 'package:flutter_movie_view_app/data/dto/movie_response_dto.dart';

/// <DataSource (implement)
class MovieDataSourceImpl implements MovieDataSource {
  final Dio _client = Dio(BaseOptions(
    validateStatus: (status) => true,
  ));

  @override
  Future<MovieDetailDto?> fetchMovieDetail(int id) async {
    final response = await _client.get(
      'https://api.themoviedb.org/3/movie/$id',
      queryParameters: {
        'language': 'ko-KR',
        'page': 1,
        'sort_by': 'popularity.desc'
      },
      options: Options(
        headers: {
          'Authorization': dotenv.env['TMDV_ACCESS_TOKEN'],
          'Accept': 'application/json',
        },
      ),
    );
    if (response.statusCode == 200) {
      return MovieDetailDto.fromJson(response.data);
    }
    return null;
  }

  @override
  Future<List<MovieResponseDto>?> fetchNowPlayingMovies() async {
    final response = await _client.get(
      'https://api.themoviedb.org/3/movie/now_playing',
      queryParameters: {
        'language': 'ko-KR',
        'page': 1,
        'sort_by': 'popularity.desc'
      },
      options: Options(
        headers: {
          'Authorization': dotenv.env['TMDV_ACCESS_TOKEN'],
          'Accept': 'application/json',
        },
      ),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      return List.from(response.data['results']).map((e) {
        return MovieResponseDto.fromJson(e);
      }).toList();
    }
    return null;
  }

  @override
  Future<List<MovieResponseDto>?> fetchPopularMovies() async {
    final response = await _client.get(
      'https://api.themoviedb.org/3/movie/popular',
      queryParameters: {
        'language': 'ko-KR',
        'page': 1,
        'sort_by': 'popularity.desc',
      },
      options: Options(
        headers: {
          'Authorization': dotenv.env['TMDV_ACCESS_TOKEN'],
          'Accept': 'application/json',
        },
      ),
    );
    if (response.statusCode == 200) {
      return List.from(response.data['results']).map((e) {
        return MovieResponseDto.fromJson(e);
      }).toList();
    }
    print(response.statusCode);
    return null;

// results>>(반복문)poster_path
// include_adult: false
// include_video: false
// language: ko-KR
// page: 1
// sort_by: popularity.desc
  }

  @override
  Future<List<MovieResponseDto>?> fetchTopRatedMovies() async {
    final response = await _client.get(
      'https://api.themoviedb.org/3/movie/top_rated',
      queryParameters: {
        'language': 'ko-KR',
        'page': 1,
        'sort_by': 'popularity.desc'
      },
      options: Options(
        headers: {
          'Authorization': dotenv.env['TMDV_ACCESS_TOKEN'],
          'Accept': 'application/json',
        },
      ),
    );
    if (response.statusCode == 200) {
      return List.from(response.data['results']).map((e) {
        return MovieResponseDto.fromJson(e);
      }).toList();
    }
    return null;
  }

  @override
  Future<List<MovieResponseDto>?> fetchUpcomingMovies() async {
    final response = await _client.get(
      'https://api.themoviedb.org/3/movie/upcoming',
      queryParameters: {
        'language': 'ko-KR',
        'page': 1,
        'sort_by': 'popularity.desc'
      },
      options: Options(
        headers: {
          'Authorization': dotenv.env['TMDV_ACCESS_TOKEN'],
          'Accept': 'application/json',
        },
      ),
    );
    if (response.statusCode == 200) {
      return List.from(response.data['results']).map((e) {
        return MovieResponseDto.fromJson(e);
      }).toList();
    }
    return null;
  }
}
