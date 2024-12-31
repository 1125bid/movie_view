//상태 클래스 만들기
import 'package:flutter_movie_view_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_view_app/presentation/providers.dart';
import 'package:riverpod/riverpod.dart';

class DetailPageState {
  MovieDetail? movieDetail;
  DetailPageState({required this.movieDetail});
}

//뷰모델 정의하기
class DetailPageViewModel
    extends AutoDisposeFamilyNotifier<DetailPageState, int> {
  @override
  build(int arg) {
    fetchMovieDetail(arg);
    return DetailPageState(movieDetail: null);
  }

  Future<DetailPageState?> fetchMovieDetail(int id) async {
    final fetchMovieDetailUseCase = ref.read(fetchMovieDetailUseCaseProvider);
    final result = await fetchMovieDetailUseCase.fetchMovieDetail(id);
    state = DetailPageState(movieDetail: result);
  }
}

//뷰모델 관리자 만들기
final detailPageViewModelProvider = NotifierProvider.autoDispose
    .family<DetailPageViewModel, DetailPageState, int>(
        () => DetailPageViewModel());
