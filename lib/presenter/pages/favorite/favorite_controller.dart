import 'package:btg_pactual_challange/domain/entities/genre_entity.dart';
import 'package:btg_pactual_challange/domain/entities/movie_entity.dart';
import 'package:btg_pactual_challange/domain/usecases/get_genre/get_genre_usecase.dart';
import 'package:btg_pactual_challange/domain/usecases/get_genre/get_genre_usecase_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class FavoriteController extends GetxController {
  late Box<MovieEntity> favoriteMovieBox;
  final TextEditingController searchEditingController = TextEditingController();
  List<MovieEntity>? favoriteMovies;
  RxList<MovieEntity> searchList = RxList([]);
  GetGenreUsecase getGenreUsecase = Get.find<GetGenreUsecaseImpl>();
  List<GenreEntity> genres = [];
  @override
  void onInit() {
    favoriteMovieBox = Hive.box('favorite');
    favoriteMovies = favoriteMovieBox.values.toList().cast<MovieEntity>();
    fetchGenres();
    updateList();
    super.onInit();
  }

  void updateList() {
    favoriteMovies = favoriteMovieBox.values.toList().cast<MovieEntity>();
    searchList.value = favoriteMovies!;
  }

  Future<void> fetchGenres() async {
    final result = await getGenreUsecase.execute();
    genres = result;
  }

  void searchForMovies() {
    if (int.tryParse(searchEditingController.text) == null) {
      final newList = favoriteMovies!
          .where(
              (element) => element.name.contains(searchEditingController.text))
          .toList();

      searchList.value = newList;
    } else {
      final newList = favoriteMovies!
          .where((element) =>
              element.releaseDate.contains(searchEditingController.text))
          .toList();

      searchList.value = newList;
    }
  }
}
