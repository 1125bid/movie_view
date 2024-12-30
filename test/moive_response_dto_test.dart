import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_movie_view_app/data/dto/movie_response_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final Dio _client = Dio(BaseOptions(
    validateStatus: (status) => true,
  ));
  test(
    'MovieResponseDto :fromJson test',
    () {
      const sampleJsonString = """
{
      "adult": false,
      "backdrop_path": "/cjEcqdRdPQJhYre3HUAc5538Gk8.jpg",
      "genre_ids": [
        28,
        14,
        35
      ],
      "id": 845781,
      "original_language": "en",
      "original_title": "Red One",
      "overview": "After Santa Claus (codename: Red One) is kidnapped, the North Pole's Head of Security must team up with the world's most infamous tracker in a globe-trotting, action-packed mission to save Christmas.",
      "popularity": 6261.101,
      "poster_path": "/cdqLnri3NEGcmfnqwk2TSIYtddg.jpg",
      "release_date": "2024-10-31",
      "title": "Red One",
      "video": false,
      "vote_average": 6.991,
      "vote_count": 1399
    }
""";
      final map = jsonDecode(sampleJsonString);
      // final movieDto= MovieResponseDto.fromJson
    },
  );
  test('인기순 영화 데이터 받아오기', () async {
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
    // expect(response.data[], matcher)
    print(response.statusCode);
  });
}
