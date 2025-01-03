// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_movie_view_app/data/dto/movie_response_dto.dart';
// import 'package:flutter_movie_view_app/data/repository/movie_repository.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   final movieRepository = MovieRepository();
//   test(
//     'MovieRepository fetchMovieDetail test',
//     () async {
//       final d = await movieRepository.fetchMovieDetail(845781);
//     },
//   );

// {
//   "adult": false,
//   "backdrop_path": "/cjEcqdRdPQJhYre3HUAc5538Gk8.jpg",
//   "belongs_to_collection": null,
//   "budget": 250000000,
//   "genres": [
//     {
//       "id": 28,
//       "name": "액션"
//     },
//     {
//       "id": 14,
//       "name": "판타지"
//     },
//     {
//       "id": 35,
//       "name": "코미디"
//     }
//   ],
//   "homepage": "",
//   "id": 845781,
//   "imdb_id": "tt14948432",
//   "origin_country": [
//     "US"
//   ],
//   "original_language": "en",
//   "original_title": "Red One",
//   "overview": "크리스마스 D-1, 철통같은 보안을 뚫고 코드명 '레드 원' 산타클로스가 납치되고 크리스마스가 사라질 위기에 처했다! '레드 원'을 찾기 위해 사령관 '칼럼 드리프트'는 산타클로스 따위는 없다고 믿는 현상금 사냥꾼 '잭 오말리'와 협력하기로 한다. 시작부터 삐그덕 거리는 이들 앞에 크리스마스의 존재를 위협하는 위험천만한 적들이 나타나는데…",
//   "popularity": 4938.342,
//   "poster_path": "/4zNUNhVpSqFggxqvdSXDRzy1QwE.jpg",
//   "production_companies": [
//     {
//       "id": 73669,
//       "logo_path": "/9JmgzVUNvUN5KhZjmiVHEzPtFCc.png",
//       "name": "Seven Bucks Productions",
//       "origin_country": "US"
//     },
//     {
//       "id": 92693,
//       "logo_path": "/rMKRo8kFoJKxZr0MFEVRoZ8b54E.png",
//       "name": "The Detective Agency",
//       "origin_country": "US"
//     },
//     {
//       "id": 25998,
//       "logo_path": null,
//       "name": "Chris Morgan Productions",
//       "origin_country": "US"
//     },
//     {
//       "id": 21,
//       "logo_path": "/usUnaYV6hQnlVAXP6r4HwrlLFPG.png",
//       "name": "Metro-Goldwyn-Mayer",
//       "origin_country": "US"
//     }
//   ],
//   "production_countries": [
//     {
//       "iso_3166_1": "US",
//       "name": "United States of America"
//     }
//   ],
//   "release_date": "2024-10-31",
//   "revenue": 182861176,
//   "runtime": 124,
//   "spoken_languages": [
//     {
//       "english_name": "English",
//       "iso_639_1": "en",
//       "name": "English"
//     }
//   ],
//   "status": "Released",
//   "tagline": "크리스마스 실종 위기, 사라진 산타를 찾기 위한 대환장 플레이",
//   "title": "레드 원",
//   "video": false,
//   "vote_average": 7.0,
//   "vote_count": 1564
// }

//   test('인기순 영화 데이터 받아오기', () async {
//     final response = await _client
//         .get('https://api.themoviedb.org/3/movie', queryParameters: {
//       'include_adult': false,
//       'include_video': false,
//       'language': 'ko-KR',
//       'page': 1,
//       'sort_by': 'popularity.desc',
//       'Authorization': dotenv.env['TMDV_ACCESS_TOKEN'],
//       'Accept': 'application/json',
//     });
//     // expect(response.data[], matcher)
//     print(response.statusCode);
//   });
// }
