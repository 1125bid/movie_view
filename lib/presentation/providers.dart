//viewmodel에서 직접 객체 생성하지 않을 수 있게
//usecase 공급해주는 provider생성
//viewmodel 내에서는 provider에 의해 usecase 공급 받을 것

import 'package:flutter_movie_view_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_view_app/data/data_source/movie_data_source_impl.dart';
import 'package:riverpod/riverpod.dart';

final movieDataSourceProvider = Provider<MovieDataSource>((ref) {
  return MovieDataSourceImpl();
});

final movieRepositoryProvider = Provider<MovieDataSourceImpl>((ref) {
  return MovieDataSourceImpl();
});
