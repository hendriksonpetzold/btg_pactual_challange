import 'package:btg_pactual_challange/domain/entities/movie_entity.dart';
import 'package:btg_pactual_challange/domain/usecases/get_movie/get_movie_usecase.dart';
import 'package:btg_pactual_challange/domain/usecases/get_movie/get_movie_usecase_impl.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends GetxController {
  final GetMovieUsecase datasource = Get.find<GetMovieUsecaseImpl>();
  RefreshController refreshController = RefreshController(initialRefresh: true);
  RxBool isLoading = RxBool(true);
  int currentPage = 1;
  RxList<MovieEntity> movie = RxList([]);

  @override
  void onInit() {
    super.onInit();
  }

  Future<bool> fetchMovies({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
    }

    final result = await datasource.execute(currentPage);
    if (result.isEmpty) {
      return false;
    } else {
      if (isRefresh) {
        movie.value = result;
      } else {
        movie.addAll(result);
      }
      currentPage++;

      return true;
    }
  }

  void onRefresh() async {
    final result = await fetchMovies(isRefresh: true);
    if (result == true) {
      refreshController.refreshCompleted();
    } else {
      refreshController.refreshFailed();
    }
  }

  void onLoading() async {
    final result = await fetchMovies();
    if (result == true) {
      refreshController.loadComplete();
    } else {
      refreshController.loadFailed();
    }
  }
}
