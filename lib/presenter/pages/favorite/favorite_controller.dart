import 'package:btg_pactual_challange/domain/entities/movie_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class FavoriteController extends GetxController {
  late Box<MovieEntity> movieFavoriteBox;
  final TextEditingController searchEditingController = TextEditingController();
  List<MovieEntity>? favoriteMovies;
  RxList<MovieEntity> searchList = RxList([]);
  @override
  void onInit() {
    movieFavoriteBox = Hive.box('favorite');
    favoriteMovies = movieFavoriteBox.values.toList().cast<MovieEntity>();

    super.onInit();
  }

  void updateList() {
    favoriteMovies = movieFavoriteBox.values.toList().cast<MovieEntity>();
    searchList.value = favoriteMovies!;
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
