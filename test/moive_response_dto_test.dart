import 'dart:convert';

import 'package:flutter_movie_view_app/data/dto/movie_response_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
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
      // final movieDto= MoiveResponseDto.fromJson
    },
  );
}
