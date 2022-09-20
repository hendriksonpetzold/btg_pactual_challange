import 'package:btg_pactual_challange/domain/entities/genre_entity.dart';
import 'package:btg_pactual_challange/domain/entities/movie_entity.dart';
import 'package:btg_pactual_challange/domain/usecases/get_genre/get_genre_usecase.dart';
import 'package:btg_pactual_challange/domain/usecases/get_genre/get_genre_usecase_impl.dart';
import 'package:btg_pactual_challange/domain/usecases/get_movie/get_movie_usecase.dart';
import 'package:btg_pactual_challange/domain/usecases/get_movie/get_movie_usecase_impl.dart';
import 'package:btg_pactual_challange/enums/movie_list_enum.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends GetxController {
  final GetMovieUsecase getMovieUsecase = Get.find<GetMovieUsecaseImpl>();
  final GetGenreUsecase getGenreUsecase = Get.find<GetGenreUsecaseImpl>();
  RefreshController refreshController = RefreshController(initialRefresh: true);
  int currentPage = 1;
  RxList<MovieEntity> movie = RxList([]);
  RxList<MovieEntity> searchMovie = RxList([]);
  List<GenreEntity> genres = [];
  TextEditingController searchEditingController = TextEditingController();
  late Box<MovieEntity> favoriteMovieBox;
  final Rx<MovieListEnum> _activeList = Rx<MovieListEnum>(MovieListEnum.all);
  MovieListEnum get activeList => _activeList.value;
  RxInt genre = RxInt(28);
  @override
  void onInit() {
    fetchGenres();
    favoriteMovieBox = Hive.box('favorite');
    super.onInit();
  }

  Future<void> fetchGenres() async {
    final result = await getGenreUsecase.execute();
    genres = result;
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
        fetchMoviesByGenre();
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

  Future<void> fetchMoviesByGenre() async {
    List<MovieEntity> newList = movie
        .where((element) => element.genreIds.contains(genre.value))
        .toList();
    searchMovie.value = newList;
  }

  void changeList({required MovieListEnum list}) {
    _activeList.value = list;
  }

  RxBool checkActiveList({required MovieListEnum list}) {
    if (list == _activeList.value) return RxBool(true);
    return RxBool(false);
  }

  void getListByGenre() {
    switch (_activeList.value) {
      case MovieListEnum.all:
        searchMovie.value = movie;

        break;
      case MovieListEnum.action:
        genre.value = 28;
        fetchMoviesByGenre();

        break;

      case MovieListEnum.adventure:
        genre.value = 12;
        fetchMoviesByGenre();

        break;

      case MovieListEnum.comedy:
        genre.value = 35;
        fetchMoviesByGenre();

        break;

      case MovieListEnum.drama:
        genre.value = 18;
        fetchMoviesByGenre();

        break;

      case MovieListEnum.horror:
        genre.value = 27;
        fetchMoviesByGenre();

        break;

      case MovieListEnum.romance:
        genre.value = 10749;
        fetchMoviesByGenre();

        break;
      default:
    }
  }
}
