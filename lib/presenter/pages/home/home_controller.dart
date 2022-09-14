import 'package:btg_pactual_challange/domain/entities/movie_entity.dart';
import 'package:btg_pactual_challange/domain/usecases/get_movie/get_movie_usecase.dart';
import 'package:btg_pactual_challange/domain/usecases/get_movie/get_movie_usecase_impl.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends GetxController {
  final GetMovieUsecase getMovieUsecase = Get.find<GetMovieUsecaseImpl>();
  RefreshController refreshController = RefreshController(initialRefresh: true);
  int currentPage = 1;
  RxList<MovieEntity> movie = RxList([]);
  RxList<MovieEntity> searchMovie = RxList([]);
  TextEditingController searchEditingController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  void searchMovies() {
    final newList = movie
        .where((e) => e.name.contains(searchEditingController.text))
        .toList();
    searchMovie.value = newList;
  }

  Future<bool> fetchMovies({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
    }

    final result = await getMovieUsecase.execute(currentPage);
    if (result.isEmpty) {
      return false;
    } else {
      if (isRefresh) {
        movie.value = result;
        searchMovie.value = result;
      } else {
        movie.addAll(result);
        searchMovie.addAll(result);
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
